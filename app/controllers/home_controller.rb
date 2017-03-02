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
    if persons.any?
      if verify_recaptcha
        person = persons.first
        new_pass = person.generate_password
        p = "#{person.gender_fa}#{person.name} \\n رمز عبور جدید شما در آبونمان خطابه غدیر و فدک: \\n #{new_pass} \\n شماره موبایل: \\n #{person.mobile_number} \\n http://ab.khetabeghadir.com/profile \\n یا علی."
        send_msg(person,p)
        redirect_to "#{root_path}#profile" , :alert => "رمز جدید برای شما ارسال شد."
      else
        redirect_to "#{root_path}#profile" , :alert => "امکان دسترسی به این بخش وجود ندارد."
      end
    else
      redirect_to "#{root_path}#profile" , :alert => "شماره موبایل #{number} تا به حال در سیستم ثبت نشده است."
    end
  end

end
