class Bug < ActiveRecord::Base

mount_uploader :image_path, ImageUploader

	belongs_to :project
	validates :title, presence: true,
  			length: { minimum: 3, maximum: 25 }

  validates :description, presence: true,
  			length: { minimum: 3, maximum: 25 }

  validates :status, presence: true

  validates :type, presence: true

  validates :deadline, presence: true
  validates_processing_of :image_path
validate :image_size_validation
 
private
  def image_size_validation
    errors[:image_path] << "should be less than 5000KB" if image_path.size > 5.megabytes
  end
end