class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true, touch: true
end
