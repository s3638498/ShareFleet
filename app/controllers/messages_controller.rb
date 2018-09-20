class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all

  end

  def show

  end

  def edit

  end

  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:success] = "Message saved!"
      redirect_to :controller => 'messages', :action => "index"
    else
      flash[:success] = message_params
      @messages = Message.all
      render :action => "index"
    end
  end

  def update

    if @message.update(message_params)
      flash[:success] = "Message updated!"
      redirect_to :controller => 'messages', :action => "index"
    else
      flash[:success] = "Message failed!"
      render :edit
    end
  end

  def destroy
    @message.destroy
    flash[:success] = "Message Deleted!"
    redirect_to user_messages_url
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :author, :administrator_id, :enduser_id)
    end
end
