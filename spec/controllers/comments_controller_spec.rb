require 'spec_helper'

describe CommentsController do
  login_user

  describe 'POST #create' do
    let(:question) { create :question }
    let(:answer) { create :answer }

    it 'loads question if parent is question' do
      post :create, comment: attributes_for(:comment), question_id: question, format: :js
      expect(assigns(:parent)).to eq question
    end

    it 'loads answer if parent is answer' do
      post :create, comment: attributes_for(:comment), answer_id: answer, format: :js
      expect(assigns(:parent)).to eq answer
    end
  end
end