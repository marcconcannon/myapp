class AddUniquenameToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :title_unique, :string
  end
end
