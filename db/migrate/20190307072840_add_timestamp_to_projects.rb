class AddTimestampToProjects < ActiveRecord::Migration[5.2]
  def change
  	add_timestamps :projects
  end
end
