require 'spec_helper'

describe DailyDigestJob do
  it 'sends daily digest' do
    expect(User).to receive(:send_daily_digest)
    DailyDigestJob.perform_now
  end
end