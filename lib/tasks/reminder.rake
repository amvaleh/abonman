require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
namespace :reminder do
  desc "TODO"

  # task: check for new sms
  task explore: :environment do
    Reminder.all.each do |r|
      if r.sms_date.day == Time.now.day
        r.sms_status = SmsStatus.find_by_name("sent")
        # here we should send sms and stuff
        case r.alert_times
        when 0 , 1 , 2 , 3
          p = "لطفا مبلغ #{r.payment.amount} را برای آبونه خطابه غدیر و فدک به شماره حساب ۱۲۱۲۳۳ بانک پاسارگاد واریز نمایید. \\n همچنین می توانید از لینک زیر مستقیما مبلغ را پرداخت کنید."
          send_msg(r.payment.person,p)
          r.alert_times += 1
          # set this reminder on 2 days from now
          r.sms_date = Time.now + 2.days
          #
          r.save
        else
          send_msg(r.payment.person,p)
          # cancel this turn payment
          payment = r.payment
          payment.payment_status_id = 3
          payment.save
          last_reminder = payment.reminder
          last_reminder.destroy
          person = r.payment.person
          new_payment = Payment.create do |p|
            p.person = person
            p.amount = (person.pay_amount.to_i + person.id).to_s
            p.deadline = payment.deadline + person.pay_period.days # later month
          end
          p = "تعداد آبونه های پرداخت نشده شما: #{person.payments.ignored.count} \\n موعد پرداخت بعدی شما #{new_payment.deadline} خواهد بود. \\n درصورت تمایل به انصراف از سامانه آبونه خطابه غدیر و فدک \\n لطفا با شماره ۲۲۳۹۳۸۱۴ تماس حاصل کنید. \\n لینک حساب کاربری شما: "
          send_msg(person,p)
        end
      end
    end
  end

end
