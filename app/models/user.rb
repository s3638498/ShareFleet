class User < ApplicationRecord
    has_many :bookings
attr_accessor :reset_token
before_save   :downcase_email
validates :password, presence: true
 def User.new_token
    SecureRandom.urlsafe_base64
  end

def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

# Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  
  
  
  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
   def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  def send_invitation_email
    UserMailer.sign_up(self).deliver_now
  end

  
  
   private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end
end
