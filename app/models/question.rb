class Question < ActiveRecord::Base
  has_many :answers, -> { includes :attachments }
  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable

  validates :title, :body, presence: true

  accepts_nested_attributes_for :attachments
end
