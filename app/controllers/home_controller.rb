class HomeController < ApplicationController

  include ApplicationHelper

  def home
    # redirect_to admin_dashboard_path
    if params[:p].present?
      if Person.where(id: params[:p]).any?
        @person = Person.find(params[:p])
      end
    elsif current_person.present?
      @person = current_person
    end
  end

  def pay
    if params[:p].present?
      if Person.where(id: params[:p]).any?
        @person = Person.find(params[:p])
      end
    elsif current_person.present?
      @person = current_person
    end
  end
  def redirect
    if params[:id].present? and Person.where(:id => params[:id]).any?
      redirect_to "http://ab.khetabeghadir.com?p=#{params[:id]}#aboneh"
    else
      redirect_to root_path , alert: "شماره یکتا اشتباه است."
    end
  end

  def profile
    redirect_to "http://ab.khetabeghadir.com?#profile"
  end


  def recover_password
    number = params[:mobile_number]
    persons = Person.where(:mobile_number => number)
    if simple_captcha_valid?
      if persons.any?
        person = persons.first
        p = "#{person.gender_fa}#{person.name} \\\\n رمز عبور جدید شما در آبونمان خطابه غدیر و فدک: \\\\n #{person.generate_password} \\\\n شماره موبایل: \\\\n #{person.mobile_number} \\\\n http://ab.khetabeghadir.com/profile \\\\n یا علی."
        send_cron_msg(person,p)
        redirect_to "#{root_path}#profile" , :alert => "رمز جدید برای شما ارسال شد."
      else
        redirect_to "#{root_path}#profile" , :alert => "شماره موبایل #{number} تا به حال در سیستم ثبت نشده است."
      end
    else
      redirect_to "#{root_path}#profile" , :alert => "خطا در عبارت امنیتی، لطفا مجددا تلاش کنید."
    end
  end

end
