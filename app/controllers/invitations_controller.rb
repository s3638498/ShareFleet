class InvitationsController < ApplicationController
   
    def new
    end
    
    def edit
end

def create
    
 @invitation = Invitation.new(invite_params)
 @code = Discount.new.generate_discount_code

    if @invitation.save
      UserMailer.sign_up(@invitation).deliver
      flash[:info] = "Invite sent!"
      redirect_to root_url
    else
      flash.now[:danger] = "Please input a valid email address"
      render 'new'
    end
   
   
end
    
end


def update
end


 private

  def invite_params
    params.require(:invitation).permit(:recipient_email)
  end
