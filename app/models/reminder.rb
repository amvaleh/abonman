class Reminder < ApplicationRecord

  belongs_to :sms_status
  belongs_to :payment




  def check
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 00000000000000 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    # Reminder.all.each do |r|
    #   r.sms_status = SmsStatus.find_by_name("observed")
    #   r.save
    # end
  end

end
