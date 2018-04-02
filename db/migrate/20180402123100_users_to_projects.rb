class UsersToProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :users_to_projects do |t|
      t.integer :project_id
      t.integer :user_id

    end
  end
end
