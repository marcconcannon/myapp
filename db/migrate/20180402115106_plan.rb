class Plan < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :plantype
      t.integer :term
    end
  end
end
