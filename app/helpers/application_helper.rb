module ApplicationHelper

  require "uri"
  require 'net/http'

  def send_sms(number,text)
    # function added after sms rake task
    pass = "1841@1841"
    result = Net::HTTP.get(URI.parse(URI.encode("http://smspanel.Trez.ir/SendMessageWithUrl.ashx?Username=khetabeghadir&Password=#{pass}&PhoneNumber=50002910001091&MessageBody=#{text}&RecNumber=#{number}&Smsclass=1")))
    puts result
    return result
  end

  def send_cron_msg(person,msg,khotbe)
    # send sms
    # client = Savon.client(wsdl: "http://mihansmscenter.com/webservice/?wsdl")
    # response = client.call(:send, message: { username: "kajpars", password: "rf75#R" , to: "#{person.mobile_number}", from: "300076500110" , message: "#{text}"})
    text = msg.gsub("\\\\n", "\n")
    pass = "1841@1841"
    result = Net::HTTP.get(URI.parse(URI.encode("http://smspanel.Trez.ir/SendMessageWithUrl.ashx?Username=khetabeghadir&Password=#{pass}&PhoneNumber=50002910001091&MessageBody=#{text}&RecNumber=#{person.mobile_number}&Smsclass=1")))
    ShortMessage.create!(:person => person , :content=> text, :response=> result )
    #
    if khotbe.present?
      msg = khotbe + msg
    end
    # send email
    if person.email_address.present?
      puts msg
      email_msg = msg.gsub(/\\\\n/ , "\\n")
      puts email_msg
      # email = ServiceMailer.send_email(person.email_address,email_msg).deliver_now
    end
    #
    payam = "\"#{msg}\""
    user_teleg_name = person.name.gsub(" ", "_") + " " + person.mobile_number.to_s
    puts "user_teleg_name: " + user_teleg_name
    # Telegram.create!(teleg_name: user_teleg_name , number: person.mobile_number , message: payam )
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
