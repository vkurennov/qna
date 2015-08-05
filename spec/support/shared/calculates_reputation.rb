shared_examples_for 'calculates reputation' do
  it 'should calculate reputation after creating' do
    expect(CalculateReputationJob).to receive(:perform_later).with(subject)
    subject.save!
  end

  it 'should not calculate reputation after update' do
    subject.save!
    expect(CalculateReputationJob).to_not receive(:perform_later)
    subject.update(body: '123')
  end
end