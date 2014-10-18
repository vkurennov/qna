class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true
end
