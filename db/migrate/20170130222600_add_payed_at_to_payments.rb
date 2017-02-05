class AddPayedAtToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :payed_at, :datetime
  end
end
