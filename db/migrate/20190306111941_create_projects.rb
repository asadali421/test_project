class CreateProjects < ActiveRecord::Migration[5.2]
  def up
    create_table   :projects do |t|
    	t.string     :title,              null: false, default: ""
      	t.string   :description,        null: false, default: ""
    end
  end

  def down
  	drop_table :projects	
  end
end
