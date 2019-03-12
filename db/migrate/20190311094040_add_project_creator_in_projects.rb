class AddProjectCreatorInProjects < ActiveRecord::Migration[5.2]
  def change
        add_column :projects, :manager_id, :integer, index: true 
        add_foreign_key :projects, :users, column: :manager_id
  end
end
