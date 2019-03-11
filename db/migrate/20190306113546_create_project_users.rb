class CreateProjectUsers < ActiveRecord::Migration[5.2]
  def change
    create_table  :project_users do |t| 	
    end
  end
  
  def down
  	drop_table :project_users
  end
end
