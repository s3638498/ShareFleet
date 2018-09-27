class InvitationsController < ApplicationController
   
    def new
        @refer = current_user.email
        
    end
    
    def edit
end

def create
      UserMailer.sign_up(invite_params).deliver
      flash[:info] = "Invite sent!"
      render 'new'
   
   
end
    
end


def update
end


 private

  def invite_params
    params.require(:invitation).permit(:recipient_email,:sender_email)
  end

