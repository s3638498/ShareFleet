class MessagesController < ApplicationController

  def index
    if administrator? 
      @enduser = Enduser.find(params[:enduser])
      @title = "Messages from " << @enduser.username
    else
      @enduser = current_user
      @title = "Messages from Administrator"
    end
    @admin = Administrator.first
    @messages = Message.where(administrator_id: @admin, enduser_id: @enduser).order("created_at DESC")
  end

  def create
    @message = Message.new(message_params)
    @message.administrator_id = Administrator.first.id
    @message.author = current_user.username
    if @message.save
      flash[:success] = "Message sent!"
      redirect_to :controller => 'messages', :action => "index", :enduser => params[:message][:enduser_id]
    else
      flash[:warning] = "Message cannot be blank!"
      @messages = Message.all
      redirect_to :controller => 'messages', :action => "index", :enduser => params[:message][:enduser_id]
    end
  end
  
  private
    def message_params
      params.require(:message).permit(:content, :enduser_id)
    end
end
