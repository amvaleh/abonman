class Person < ApplicationRecord
  include ApplicationHelper

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of [:name,:mobile_number,:pay_period,:pay_start,:pay_amount,:gender]


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
    pass = 1_000 + Random.rand(10_000 - 1_000)
    person = self
    person.password = pass
    person.password_confirmation = pass
    puts pass
    person.save
    p = "#{self.gender_fa} #{self.name} \\\\n اطلاعات شما در سامانه همیار خطابه غدیر و فدک به روز رسانی شد.\\\\n http://ab.khetabeghadir.com/#profile \\\\n شماره موبایل: \\\\n #{person.mobile_number} \\\\n  رمز عبور شما: #{pass} \\\\n یا علی."
    send_msg(person,p)
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
    pass = 1_000 + Random.rand(10_000 - 1_000)
    person = self
    person.password = pass
    person.password_confirmation = pass
    person.save
    return pass
  end


  def payment_deadline
    # ًTODO : calculate number of payments, then set the deadline
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

  def gender_fa
    case self.gender.name
    when "آقا"
      "جناب آقای "
    when "خانم"
      "سرکار خانم"
    end
  end

  scope :men, -> { where(gender_id: Gender.find_by_name("آقا").id) }
  scope :women, -> { where(gender_id: Gender.find_by_name("خانم").id) }
  scope :tehran, -> { where(city_id: City.find_by_name("تهران").id) }
  scope :khosh_heshab , -> { joins(:payments).where(%q{payed_at - deadline < interval '1 week'} ).distinct }
  scope :bad_hesab , -> { joins(:payments).where(%q{payed_at - deadline < interval '1 week'} ).distinct }


  scope :with_birthday , -> { where("birthdate is not null")}
end
