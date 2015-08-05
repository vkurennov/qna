class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :attachments, as: :attachmentable
  has_many :comments, as: :commentable

  validates :body, presence: true

  accepts_nested_attributes_for :attachments

  default_scope -> { order :created_at }

  after_create :update_reputation

  private

  def update_reputation
    CalculateReputationJob.perform_later(self)
  end
end
