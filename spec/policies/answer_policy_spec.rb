require 'spec_helper'

describe AnswerPolicy do

  let(:user) { create :user }

  subject { AnswerPolicy }


  permissions :update? do
    it 'grants access if user is admin' do
      expect(subject).to permit(User.new(admin:true), create(:answer))
    end

    it 'grant access if user is author' do
      expect(subject).to permit(user, create(:answer, user: user))
    end

    it 'denies access if user is not author' do
      expect(subject).not_to permit(User.new, create(:answer, user: user))
    end
  end
end
