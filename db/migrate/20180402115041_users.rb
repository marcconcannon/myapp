class Users < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :firstname
      t.string :lastname
      t.string :avitar
      t.integer :customer_id
      t.boolean :is_admin
      t.boolean :is_owner
      t.timestamps

    end
  end
end
