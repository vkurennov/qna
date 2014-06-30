class QuestionsController < InheritedResources::Base
  before_action :authenticate_user!, only: [ :new, :create ]
  load_and_authorize_resource
  before_action :build_answer, only: :show
  before_action :build_attachment, only: :new

  respond_to :html

  protected

  def create_resource(object)
    object.user = current_user
    super
  end

  def build_answer
    @answer = resource.answers.build
    @answer.attachments.build
  end

  def build_attachment
    build_resource.attachments.build
  end

  def question_params
    params.require(:question).permit(:title, :body, attachments_attributes: [:file])
  end
end
