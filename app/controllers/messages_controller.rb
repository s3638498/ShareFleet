class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @messages = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to :controller => 'messages', :action => "index"
    else
      @messages = Message.all
      render :action => "index"
    end
  end

  def update
    if @message.update(message_params)
      redirect_to @message
      flash[:success] = "Message updated!"
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    flash[:success] = "Message Deleted!"
    redirect_to messages_url
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :author, :administrator_id, :enduser_id)
    end
end
