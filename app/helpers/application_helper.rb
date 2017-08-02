module ApplicationHelper
  # def send_msg(person,msg)
  #   # send email
  #   if person.email_address.present?
  #     puts msg
  #     email_msg = msg
  #     puts email_msg
  #     # email = ServiceMailer.send_email(person.email_address,email_msg).deliver_now
  #     # puts email
  #   end
  #   #
  #   # # send sms
  #   client = Savon.client(wsdl: "http://mihansmscenter.com/webservice/?wsdl")
  #   text = msg.gsub("\\n", "\n")
  #   # response = client.call(:send, message: { username: "kajpars", password: "rf75#R" , to: "#{person.mobile_number}", from: "300076500110" , message: "#{text}"})
  #   # ShortMessage.create!(:person => person , :content=> text, :response=> response.body[:send_response][:status_message])
  #   #
  #   # send telegram
  #
  #
  #   payam = "\"#{message}\""
  #   user_teleg_name = Time.now.to_s.gsub(" ", "_") + " " + to.to_s
  #   Telegram.create!(teleg_name: user_teleg_name , number: to , message: payam )
  #
  #
  #   contact_name = person.name.gsub(" ", "_")
  #   contact_name2 = contact_name + " " + person.pay_period.to_s + "mah"
  #   res1 = `#{telegram_path} -W -e 'add_contact +98#{person.mobile_number} #{contact_name2}'`
  #   msg = "\"#{msg}\""
  #   puts contact_name2.gsub(" ", "_")
  #   res2 = `#{telegram_path} -W -e 'msg #{contact_name2.gsub(" ", "_")} #{msg}'`
  #   puts res2
  #   logger.info(res2)
  # end

  def send_cron_msg(person,msg,khotbe)
    # send sms
    client = Savon.client(wsdl: "http://mihansmscenter.com/webservice/?wsdl")
    text = msg.gsub("\\\\n", "\n")
    response = client.call(:send, message: { username: "kajpars", password: "rf75#R" , to: "#{person.mobile_number}", from: "300076500110" , message: "#{text}"})
    ShortMessage.create!(:person => person , :content=> text, :response=> response.body[:send_response][:status_message])
    #
    if khotbe.present?
      msg = khotbe + msg
    end
    # send email
    if person.email_address.present?
      puts msg
      email_msg = msg.gsub(/\\\\n/ , "\\n")
      puts email_msg
      email = ServiceMailer.send_email(person.email_address,email_msg).deliver_now
    end
    #
    payam = "\"#{msg}\""
    user_teleg_name = person.name.gsub(" ", "_") + " " + person.mobile_number.to_s
    puts "user_teleg_name: " + user_teleg_name
    Telegram.create!(teleg_name: user_teleg_name , number: person.mobile_number , message: payam )
    #
  end


  def telegram_path
    if Rails.env.production?
      # "/Users/amirmahdi/Documents/telegram-cli/tg/bin/telegram-cli -k /Users/amirmahdi/Documents/telegram-cli/tg/server.pub"
      "/home/deploy/tg/bin/telegram-cli -k /home/deploy/tg/server.pub"
    else
      "/Users/amirmahdi/Documents/telegram-cli/tg/bin/telegram-cli -k /Users/amirmahdi/Documents/telegram-cli/tg/server.pub"
    end
  end

  def resource_name
    :person
  end

  def resource
    @resource ||= Person.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:person]
  end

  def group_by_criteria
    created_at.to_date.to_pdate.to_s(:db)
  end

end
