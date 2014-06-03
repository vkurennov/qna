class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :attachments, as: :attachmentable

  validates :body, presence: true

  accepts_nested_attributes_for :attachments

  default_scope -> { order :created_at }
end
