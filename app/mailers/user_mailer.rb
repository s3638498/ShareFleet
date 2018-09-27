class UserMailer < ApplicationMailer
    def password_reset(user)
        @user = user
        mail to: user.email, subject: "Password reset, from Share-Fleets!"
    end
    
    def sign_up(invitation)
        @invitation = invitation[:recipient_email]
        @referer = invitation[:sender_email]
        mail to: @invitation, subject: "You have been invited to Share-Fleets!"
    end
    
    def send_promo_code(email,code)
        @email = email
        @code = code
        mail to: @email, subject: "Promotional code from Share-Fleets"
    end
end
    
    
