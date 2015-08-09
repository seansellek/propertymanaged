class Picture < ActiveRecord::Base
  validates :image, presence: true

  has_attached_file :image
  belongs_to :ticket
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :less_than => 2.megabytes


end
