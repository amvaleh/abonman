class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.string :merchant_code
      t.string :card_number
      t.string :support_number
      t.string :support_email

      t.timestamps
    end
  end
end
