class Question < ActiveRecord::Base
  has_many :answers, -> { includes :attachments }
  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable
  belongs_to :user

  validates :title, :body, presence: true

  accepts_nested_attributes_for :attachments

  after_create :update_reputation

  private

  def update_reputation
    CalculateReputationJob.perform_later(self)
  end
end
