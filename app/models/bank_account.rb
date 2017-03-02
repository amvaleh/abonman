class BankAccount < ApplicationRecord

  has_many :people
  validates_presence_of [:name,:support_email,:support_number,:merchant_code, :card_number, :account_number, :bank_name]


end
