class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table 		 :bugs do |t|
    	t.string 		   :title,               null: false, default: ""
      	t.string 		 :description,         				default: ""
      	t.string 		 :status,              null: false, default: ""
      	t.string 		 :type,			       null: false, default: ""
      	t.string 		 :image_path, 						default: ""
      	t.timestamp  :deadline,			   null: false, default: ""
      	t.integer		 :created_by,		   null: false
      	t.integer		 :solved_by 

    end
  end

  def down
  	drop_table :bugs	
  end
end
