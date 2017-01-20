class AddDateToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :deadline, :date
  end
end
