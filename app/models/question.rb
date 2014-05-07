class Question < ActiveRecord::Base
  has_many :answers

  validates :title, :body, presence: true
end
