class UserMailer < ApplicationMailer

    
    
     def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
     end
  
  def sign_up(invitation)
      @invitation = invitation[:recipient_email]
      @referer = invitation[:sender_email]
     mail to: @invitation, subject: "You have been invited!"
     

  end
  end

   
