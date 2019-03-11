class AddTimeToBugs < ActiveRecord::Migration[5.2]
  def change
  	add_timestamps :bugs
  end
end
