class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :managed_projects, class_name: "Project" ,foreign_key: :manager_id
  has_many :project_users  
  has_many :projects, through: :project_users
  has_many :bugs, class_name: "Bug", foreign_key: :created_by
  has_many :bugs_solved, class_name: "Bug", foreign_key: :solved_by



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
  			length: { minimum: 3, maximum: 25 }

  validates :user_type, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 105 },
  			uniqueness: { case_sensitive: false },
  			format: { with: VALID_EMAIL_REGEX }


  

end
