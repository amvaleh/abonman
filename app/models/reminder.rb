class Reminder < ApplicationRecord

  belongs_to :sms_status
  belongs_to :person

end
