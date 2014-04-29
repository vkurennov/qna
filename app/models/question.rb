class Question < ActiveRecord::Base
  validates :title, :body, presence: true
end
