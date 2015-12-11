class MessagesController < ApplicationController
  def index
    @message = Message.where("receiver_id = ?", session[:user_id])
    
  end

  def new
      
  end

  def create
      @message = Message.new(message_params)
      @message.sender_id = session[:user_id]
      @message.receiver_id = session[:user_id]

      if @message.save 
        redirect_to messages_path
      else
        render 'new'
      end
  end

  private 
  def message_params
    params.require(:message).permit(:body)
  end
end
