class AddBankNameToBankAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :bank_accounts, :bank_name, :string
  end
end
