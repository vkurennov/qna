class AnswersController < InheritedResources::Base
  respond_to :js, :json
  actions :create, :update

  load_and_authorize_resource

  belongs_to :question


  # def create
  #   create! do |success, failure|
  #     success.js do
  #       PrivatePub.publish_to "/questions/#{parent.id}/answers", answer: resource.to_json
  #       render nothing: true
  #     end
  #     success.json { render json: resource.to_json }
  #
  #     failure.json { render json: @answer.errors.full_messages, status: :unprocessable_entity }
  #   end
  # end

  private

  def create_resource(object)
    object.user = current_user
    super
  end

  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: [:file])
  end
end
