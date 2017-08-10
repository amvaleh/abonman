ActiveAdmin.register Payment do


  permit_params :id, :amount , :payment_status_id , :person_id , :deadline, :uid

  menu label: "پرداخت ها" , priority: 2

  scope proc{ I18n.t'active_admin.scope.people.all'}, :all
  scope proc{ I18n.t'active_admin.scope.payment.done'}, :done
  scope proc{ I18n.t'active_admin.scope.payment.not_payed'}, :not_payed
  scope proc{ I18n.t'active_admin.scope.payment.incoming'}, :incoming

  index  :title => 'پرداخت ها' do
    render "payment_index"
    selectable_column
    column "مشترک" do |p|
      p.person
    end
    column "مبلغ-تومان" do |p|
      " #{p.amount.to_i} "
    end
    column "وضعیت پرداخت" do |p|
      p.farsi_status
    end
    column "تاریخ مهلت پرداخت" do |p|
      p.deadline.to_pdate.strftime("%A %d %b %Y") if p.deadline.present?
    end
    column "تاریخ انجام پرداخت" do |p|
      p.payed_at.to_date.to_pdate.strftime("%A %d %b %Y") if p.payed_at.present?
    end
    column "شناسه پیگیری پرداخت اینترنتی" do |p|
      p.uid
    end
    actions
  end

  form do |f|
    f.inputs "Payment" do
      f.input :payment_status
      f.input :amount
      f.input :uid
      f.input :deadline , :as => :string, :input_html => {:class => 'fa-date'}
    end
    f.actions
    f.inputs class: "hidden" do
      f.template.render partial: 'payment_edit'
    end
  end

  # filter :people_name_cont , label: "شخص" , as: :string
  filter :person_name, :as => :string , label: "نام مشترک"
  filter :uid , label: "شناسه پیگیری پرداخت"
  filter :amount , label: "مبلغ - تومان"
  filter :deadline , label: "مهلت پرداخت در بازه"
  filter :payed_at , label: "انجام پرداخت در بازه"
  filter :created_at , label: "پرداخت های در بازه"
  filter :payment_status , label: "وضعیت پرداخت"
  # filter :amount , label: "مبلغ - تومان"


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


end
