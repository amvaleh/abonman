class ServiceMailer < ApplicationMailer

  def send_email(email,msg)
    @email = email
    @msg = msg
    res = mail(:to => @email ,:subject => "آبونمان خطابه غدیر و فدک" , :content_type => "text/html")
    puts res
  end
end
