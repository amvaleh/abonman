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
      if self.reminder.present?
        # delete reminder
        r = self.reminder
        r.destroy
      end
      # set new payment if payment is for a person
      if self.person.present?
        payment = Payment.create do |p|
          p.person = self.person
          p.amount = (self.person.pay_amount.to_i + self.person.id).to_s
          p.deadline = self.deadline + self.person.pay_period.days # later month
        end
        p= "پرداخت #{self.deadline} شما دریافت شد. التماس دعای فرج."
        p = p + "موعد پرداخت بعدی شما #{payment.deadline} خواهد بود."
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

  def farsi_status
    case self.payment_status_id
    when 1
      "انتظار پرداخت"
    when 2
      "پرداخت شده"
    when 3
      "رد شده"
    end
  end
end
