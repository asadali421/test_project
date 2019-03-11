class AddReferenceToDeveloper < ActiveRecord::Migration[5.2]
  def change
  	add_reference :project_users, :user
  end
end
