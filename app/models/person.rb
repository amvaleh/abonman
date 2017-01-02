class Person < ApplicationRecord

  validates_presence_of [:name,:mobile_number,:pay_period,:pay_start,:pay_amount]

  scope :two, -> { where(pay_period: '2') }

  belongs_to :city
  belongs_to :gender
  has_many :reminders


  # before_save :update_reminders
  after_create :create_reminders


  def create_reminders
    reminder = Reminder.new
    reminder.person = self
    reminder.sms_date = self.pay_start + pay_period.months
    reminder.sms_status = SmsStatus.find_by_name("stored")
    reminder.save!
  end





end
