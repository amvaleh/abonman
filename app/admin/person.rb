ActiveAdmin.register Person do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model

  permit_params :name, :email, :mobile_number,:phone_number,:pay_start,:pay_period,:pay_amount, :gender_id,:city_id,:birthdate,:phone_number

  menu priority: 1

  scope :all, default: true
  # scope :two

  index do
    selectable_column
    column :id
    column :name
    column :mobile_number
    column :pay_start
    column :pay_period
    column :pay_amount
    column :created_at
    actions
  end


  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


end
