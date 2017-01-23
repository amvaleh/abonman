class CorrectEmail < ActiveRecord::Migration[5.0]
  def change
    remove_column :people , :email
    add_column :people , :email_address , :string
  end
end
