class Company < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :domain
      t.integer :plan_id
      t.datetime :plan_modified_date
      t.string :old_plan_id
      t.datetime :old_plan_modified_date
      t.timestamps

    end
  end
end
