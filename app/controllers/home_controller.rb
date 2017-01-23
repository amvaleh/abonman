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

end
