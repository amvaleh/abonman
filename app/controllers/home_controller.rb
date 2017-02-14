class HomeController < ApplicationController

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

end
