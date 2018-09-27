class InvitationsController < ApplicationController
    def new
        @referer = current_user.email
    end
    
    def create
        if !invite_params[:recipient_email].blank?
            UserMailer.sign_up(invite_params).deliver
            flash.now[:success] = "Invite sent!"
        else
            flash.now[:warning] = "Cannot send a empty email!"
        end
        render 'new'
    end

    private
    def invite_params
        params.require(:invitation).permit(:recipient_email,:sender_email)
    end
end

