class OccupancyPicture < ActiveRecord::Base
  validates :image, presence: :true
  belongs_to :property_tenant

  has_attached_file :image
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 2.megabytes

end
