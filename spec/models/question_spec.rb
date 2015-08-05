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

    it_behaves_like 'calculates reputation'
  end
end
