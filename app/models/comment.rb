class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, polymorphic: true
  validates  :body, presence: true
end
