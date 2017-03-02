class AddAccountNumberToBankAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :bank_accounts, :account_number, :string
  end
end
