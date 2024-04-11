class RemoveConfirmableFieldsFromUsers < ActiveRecord::Migration[6.0]
   def change
     if column_exists?(:users, :unconfirmed_email)
       remove_column :users, :unconfirmed_email, :string
     end
   end
 end
 