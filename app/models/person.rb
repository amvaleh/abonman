class Person < ApplicationRecord
  include ApplicationHelper

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of [:name,:mobile_number,:pay_period,:pay_start,:pay_amount]


  devise :database_authenticatable, :registerable,
  :rememberable, :trackable,
  :authentication_keys => [:mobile_number]


  validates_uniqueness_of :mobile_number
  scope :two, -> { where(pay_period: '2') }

  belongs_to :city
  belongs_to :gender
  has_many :payments

  after_create :set_payment , :initiate

  after_update :update_payment

  after_save :hi_telegram_contact

  before_destroy :destroy_payments

  def destroy_payments
    self.payments.destroy_all
  end


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

  def initiate
    pass = 1_000_000 + Random.rand(10_000_000 - 1_000_000)
    person = self
    person.password = pass
    person.password_confirmation = pass
    puts pass
    person.save
    telegram_cli = telegram_path
    contact_name = self.name
    contact_name = contact_name.gsub(" ", "_")
    contact_name2 = contact_name + " " + self.pay_period.to_s + "mah"
    puts contact_name2
    res = `#{telegram_cli} -W -e 'add_contact +98#{self.mobile_number}  #{contact_name2}'`
    puts res
    p = "\"#{self.name} محترم \\n اطلاعات شما در سامانه همیار خطابه غدیر و فدک به روز رسانی شد.\\n http://ab.khetabeghadir.com/#profile \\n شماره موبایل: \\n #{person.mobile_number}  رمز عبور شما: #{pass} یا علی.\""
    puts p
    res = `#{telegram_cli} -W -e 'msg #{contact_name2.gsub(" ", "_")} #{p}'`
    puts res
  end

  def hi_telegram_contact
    # telegram_cli = "/Users/amirmahdi/Documents/telegram-cli/tg/bin/telegram-cli"
    # contact_name = self.name
    # contact_name = contact_name.gsub(" ", "_")
    # contact_name2 = contact_name + " " + self.pay_period.to_s + "mah"
    # puts contact_name2
    # res = `#{telegram_cli} -W -e 'add_contact +98#{self.mobile_number}  #{contact_name2}'`
    # puts res
    # p = "\"#{self.name} محترم \\n اطلاعات شما در سامانه همیار خطابه غدیر و فدک به روز رسانی شد.\\n  یا علی.\""
    # puts p
    # res = `#{telegram_cli} -W -e 'msg #{contact_name2.gsub(" ", "_")} #{p}'`
    # puts res
  end

  def not_payed_turns
    total = 0
    self.payments.ignored.each do |p|
      total = total + p.amount - self.id
    end
    return total
  end

  def need_to_pay # wating and ignored
    total = 0
    self.payments.need_to_pay.each do |p|
      total = total + p.amount
    end
    return total
  end


  def amount_for_the_person # wating and ignored
    total = 0
    self.payments.need_to_pay.each do |p|
      total = total + p.amount - self.id
    end
    return total
  end


  def generate_password
    pass = 1_000_000 + Random.rand(10_000_000 - 1_000_000)
    person = self
    person.password = pass
    person.password_confirmation = pass
    person.save
    return pass
  end



  def payment_deadline
    self.pay_start + self.pay_period.days #later should be month
  end

  def my_payment_amount
    self.pay_amount + self.id
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end


end
