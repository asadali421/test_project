class Project < ActiveRecord::Base
	
  belongs_to :manager, class_name: "User", foreign_key: :manager_id 
	has_many :project_users, dependent: :destroy
	has_many :users , through: :project_users
	has_many :bugs, dependent: :destroy

  validates :title, presence: true,
        length: { minimum: 3, maximum: 25 }

  validates :description, presence: true,
        length: { minimum: 3, maximum: 25 }

end