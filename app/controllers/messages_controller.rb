class MessagesController < ApplicationController
  def index
    @messages ||= []
    if params[:relationship_id] 
      relation = Relationship.find(params[:relationship_id])
      @messages = Message.where("(sender_id = ? and receiver_id = ?) or (sender_id = ? and receiver_id = ?)", 
        relation.from.id, relation.to.id,
        relation.to.id, relation.from.id)
    end
    @friends = current_user.friends
    @friends << current_user.their_friends
    
  end

  def create
    relation = Relationship.find(params[:relationship_id])
    @message = Message.new(message_params)
    @message.sender = relation.from
    @message.receiver = relation.to

    if @message.save 
      redirect_to relationship_messages_path(params[:relationship_id])
    else
      render 'new'
    end
  end

  private 
  def message_params
    params.require(:message).permit(:body)
  end
end
