require 'spec_helper'

describe Answer do
  it { should belong_to :question }
  it { should have_many :attachments }

  it { should validate_presence_of :body }

  it { should accept_nested_attributes_for :attachments }

  describe 'reputation' do
    let(:user) { create(:user) }
    let(:question) { create(:question) }
    subject { build(:answer, user: user, question: question) }

    it_behaves_like 'calculates reputation'
  end
end
