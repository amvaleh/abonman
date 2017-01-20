class Person < ApplicationRecord

  validates_presence_of [:name,:mobile_number,:pay_period,:pay_start,:pay_amount]

  scope :two, -> { where(pay_period: '2') }

  belongs_to :city
  belongs_to :gender
  has_many :payments

  after_create :set_payment , :hi_telegram_contact

  after_update :update_payment

  after_save :hi_telegram_contact

  def set_payment
    payment = Payment.new
    payment.person = self
    payment.amount = (self.pay_amount.to_i + self.id).to_s
    payment.deadline =  self.payment_deadline
    payment.amount = self.pay_amount + self.id
    payment.save
  end

  def update_payment
    p = self.payments.last
    if self.pay_start_changed? or self.pay_period_changed?
      p.deadline = self.payment_deadline
    end
    if self.pay_amount_changed?
      p.amount = my_payment_amount
    end
    p.save
  end


  def hi_telegram_contact
    telegram_cli = "/Users/amirmahdi/Documents/telegram-cli/tg/bin/telegram-cli"
    contact_name = self.name
    contact_name = contact_name.gsub(" ", "_")
    contact_name2 = contact_name + " " + self.pay_period.to_s + "mah"
    puts contact_name2
    res = `#{telegram_cli} -W -e 'add_contact +98#{self.mobile_number}  #{contact_name2}'`
    puts res
    p = "\"#{self.name} محترم \\n اطلاعات شما در سامانه همیار خطابه غدیر و فدک به روز رسانی شد.\\n یا علی.\""
    puts p
    res = `#{telegram_cli} -W -e 'msg #{contact_name2.gsub(" ", "_")} #{p}'`
    puts res
  end



  def payment_deadline
    self.pay_start + self.pay_period.days #later should be month
  end

  def my_payment_amount
    self.pay_amount + self.id
  end




end
