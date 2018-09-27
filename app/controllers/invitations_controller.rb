class InvitationsController < ApplicationController
    def new
        @referer = current_user.email
    end
    
    def create
        UserMailer.sign_up(invite_params).deliver
        flash.now[:success] = "Invite sent!"
        render 'new'
    end

    private
    def invite_params
        params.require(:invitation).permit(:recipient_email,:sender_email)
    end
end

