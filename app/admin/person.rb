ActiveAdmin.register Person do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :email_address, :mobile_number,:phone_number,:pay_start,:pay_period,:pay_amount, :gender_id,:city_id,:birthdate,:phone_number , :encrypted_password, :password

  menu priority: 2

  # scope :all, default: true
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

  show do
    attributes_table :name, :email_address,:encrypted_password, :mobile_number,:phone_number,:pay_start,:pay_period,:pay_amount, :gender_id,:city_id,:birthdate,:phone_number
    panel "پرداخت های #{person.name}" do
      table_for person.payments.order("deadline DESC") do
        column :amount
        column :deadline
        column :payment_status_id
      end
    end
    active_admin_comments
  end


  form do |f|
    f.inputs "Person" do
      f.input :id
      f.input :name
      f.input :email_address
      # f.input :encrypted_password
      f.input :mobile_number
      f.input :phone_number
      f.input :gender
      f.input :city
      f.input :birthdate
      f.input :pay_start
      f.input :pay_period
      f.input :pay_amount
    end
    f.actions
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
