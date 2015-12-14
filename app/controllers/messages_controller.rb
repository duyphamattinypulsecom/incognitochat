class MessagesController < ApplicationController
  def index
    @messages ||= []
    @displayMsg = false
    if params[:relationship_id] 
      @relation = Relationship.find(params[:relationship_id])
      @displayMsg = @relation.new_message

      @messages = Message.where("(sender_id = ? and receiver_id = ?) or (sender_id = ? and receiver_id = ?)", 
        @relation.from.id, @relation.to.id,
        @relation.to.id, @relation.from.id).order('updated_at desc')

      # mark as no new message
      
      @messages.each do |m|
        if !m.read && m.receiver_id == session[:user_id]
          m.update_attribute(:read, true)
          @relation.update_attribute(:new_message, false)
          # set it back to true to display on view for this time only
          m.read = false
        end
      end
    end

    @my_friends = current_user.friends
    @their_friends = current_user.their_friends

  end

  def create
    relation = Relationship.find(params[:relationship_id])
    @message = Message.new(message_params)
    @message.sender = current_user

    @message.receiver = relation.to
    if relation.to.id == current_user.id
      @message.receiver = relation.from
    end

    if @message.save && relation.update_attribute(:new_message, true)
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
