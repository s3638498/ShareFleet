# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
 def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
  
  
  def sign_up
    user = Invitation.first
   UserMailer.sign_up(user)
  end
end
