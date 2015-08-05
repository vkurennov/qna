class CalculateReputationJob < ActiveJob::Base
  queue_as :default

  def perform(object)
    reputation = Reputation.calculate(object)
    object.user.update(reputation: reputation)
  end
end
