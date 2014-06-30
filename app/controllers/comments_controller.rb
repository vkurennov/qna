class CommentsController < InheritedResources::Base
  respond_to :js
  actions :create

  load_and_authorize_resource

  belongs_to :question, :answer, polymorphic: true

  protected

  def comment_params
    params.require(:comment).permit(:body)
  end
end