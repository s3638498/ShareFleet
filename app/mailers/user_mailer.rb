class UserMailer < ApplicationMailer
    
     def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
  
  def sign_up(invitation)
      @invitation = invitation
     mail to: invitation.recipient_email, subject: "You have been invited!"
     

  end
  end

   
