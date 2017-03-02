class AddBankAccountIdToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :bank_account_id, :integer
  end
end
