ActiveAdmin.register Payment do


  permit_params :id, :amount , :payment_status_id , :person_id , :deadline

  menu label: "پرداخت ها" , priority: 2

  scope proc{ I18n.t'active_admin.scope.people.all'}, :all
  scope proc{ I18n.t'active_admin.scope.payment.done'}, :done
  scope proc{ I18n.t'active_admin.scope.payment.not_payed'}, :not_payed
  scope proc{ I18n.t'active_admin.scope.payment.incoming'}, :incoming

  index do
    selectable_column
    column :id
    column "مشترک" do |p|
      p.person
    end
    column "مبلغ-تومان" do |p|
      " #{p.amount.to_i} "
    end
    column "وضعیت پرداخت" do |p|
      p.farsi_status
    end
    column "شناسه پیگیری پرداخت اینترنتی" do |p|
      p.uid
    end
    column "موعد پرداخت" do |p|
      p.deadline.to_pdate.strftime("%A %d %b %Y") if p.deadline.present?
    end
    column "تاریخ پرداخت" do |p|
      p.payed_at.to_date.to_pdate.strftime("%A %d %b %Y") if p.payed_at.present?
    end
    actions
  end

  form do |f|
    f.inputs "Payment" do
      f.input :payment_status
      f.input :uid
      f.input :deadline , :as => :string, :input_html => {:class => 'fa-date'}
    end
    f.actions
  end

  filter :payment_status , label: "وضعیت پرداخت"
  filter :amount , label: "مبلغ - تومان"
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
