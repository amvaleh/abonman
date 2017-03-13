class Payment < ApplicationRecord
  include ApplicationHelper

  belongs_to :person
  has_one :reminder
  belongs_to :payment_status

  after_save :set_reminder

  after_create :create_reminder

  after_update :check_if_done

  before_destroy :destroy_reminder

  def destroy_reminder
    self.reminder.destroy if self.reminder.present?
  end

  def check_if_done
    if self.payment_status == PaymentStatus.find_by_name("done")
      self.update_column('payed_at' , Time.now)
      if self.reminder.present?
        # delete reminder
        r = self.reminder
        r.destroy
      end
      # set new payment if payment is for a person
      if self.person.present? and self.person.payments.wating.count == 0
        payment = Payment.create do |p|
          p.person = self.person
          p.amount = (self.person.pay_amount.to_i + self.person.id).to_s
          p.deadline = self.deadline + self.person.pay_period.month # later month
        end
      end
      # thanks person with message
      if self.person.present?
        p= "پرداخت #{self.deadline.to_pdate.strftime("%b")} ماه شما در تاریخ #{self.payed_at.to_date.to_pdate.strftime("%e %b %Y")} دریافت شد.\\n"
        if payment.present?
          p = p + "موعد پرداخت بعدی شما #{payment.deadline.to_pdate.strftime("%e %b %Y")} خواهد بود.\\n"
        end
        p = p + "التماس دعای فرج."
        send_msg(self.person,p)
      end
    end
  end

  def set_reminder
    if self.reminder.present?
      reminder = self.reminder
      if self.deadline_changed?
        reminder.sms_date = self.deadline
        reminder.sms_status_id = 1
        reminder.save!
      end
    end
  end

  def create_reminder
    if self.person.present?
      reminder = Reminder.new
      reminder.payment = self
      reminder.sms_date = self.deadline
      reminder.sms_status_id = 1
      reminder.save!
    end
  end

  def sms_amount
    self.payment + self.person.id
  end

  scope :need_to_pay, -> { where('payment_status_id <> ? ' , 2) }
  scope :wating, -> { where(payment_status_id: '1') }
  scope :done, -> { where(payment_status_id: '2') }
  scope :ignored, -> { where(payment_status_id: '3') }

  scope :on_time, lambda { where(["payed_at - deadline < ? ", 1.week]) }

  scope :incoming, -> { where('payment_status_id = ? and deadline >= ?' , PaymentStatus.find_by_name("wating").id , Time.now ) }
  scope :not_payed, -> { where('payment_status_id = ? or payment_status_id = ?' , PaymentStatus.find_by_name("ignored").id , 4 ) }

  def farsi_status
    case self.payment_status_id
    when 1
      "انتظار پرداخت"
    when 2
      "پرداخت شده"
    when 3
      "نادیده گرفته شده"
    end
  end
end
