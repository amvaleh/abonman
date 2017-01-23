class AddUidToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :uid, :string
  end
end
