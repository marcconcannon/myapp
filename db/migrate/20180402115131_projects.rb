class Projects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :customer_id
      t.integer :type
      t.timestamps
    end
  end
end
