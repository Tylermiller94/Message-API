class Api::V1::ItemsController < Api::V1::ApiController


  def index
    @messages = Message.all
    json_response(@message)
  end

  def show
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @message = Message.create!(message_params)
    json_response(@message, :created)
  end

  def update
    @message.update!(messages_params)
    if @message.update!(message_params)
      render status: 200, json: {
        message: "Message Updated"
      }
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def message_params
    params.permit(:author, :content)
  end
end
