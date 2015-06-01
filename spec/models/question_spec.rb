require 'spec_helper'

describe Question do
  subject { build(:question) }

  it { should have_many :answers }
  it { should have_many :attachments }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  it { should accept_nested_attributes_for :attachments }

  its(:title) { should == "MyString" }

  describe 'reputation' do
    let(:user) { create(:user) }
    subject { build(:question, user: user) }
    it 'should calculate reputation after creating' do
      expect(Reputation).to receive(:calculate).with(subject)
      subject.save!
    end

    it 'should not calculate reputation after update' do
      subject.save!
      expect(Reputation).to_not receive(:calculate)
      subject.update(title: '123')
    end

    it 'should save user reputation' do
      allow(Reputation).to receive(:calculate).and_return(5)
      expect { subject.save! }.to change(user, :reputation).by(5)
    end

    it 'test time' do
      now = Time.now.utc
      allow(Time).to receive(:now) { now }
      subject.save!
      expect(subject.created_at).to eq now
    end
  end

  it 'test double' do
    allow(Question).to receive(:find) { double(Question, title: '123') }
    expect(Question.find(155).title).to eq '123'
  end


end
