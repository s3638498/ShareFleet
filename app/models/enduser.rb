class Enduser < User
    attr_accessor :remember_token
    
    VALID_USERNAME_REGEX = /\A[A-Za-z0-9_-]*\z/
    validates :username,  
    presence: true, 
    length: { minimum:3, maximum: 50 },
    format: { with: VALID_USERNAME_REGEX ,
    message: "can only contain letters, digits, dashes and underscores." },
    uniqueness: true
    
    has_secure_password
    VALID_PASSWORD_REGEX =/\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()]).*\z/
    validates :password, presence: true,
    length: { minimum: 8 }, 
    format: { with: VALID_PASSWORD_REGEX,
    message: "must contain at least one uppercase letter, one special character, one number and one lowercase letter." },
    allow_nil: true
    
    validates :first_name, presence: true,
    length: { minimum: 2, maximum: 50}
    
    validates :last_name, presence: true,
    length: { minimum: 2, maximum: 50 }
    
    validates :date_of_birth, presence: true
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX }
    
    VALID_NUMBER_REGEX =/\A[0-9]*\z/
    validates :contact_number, presence: true,
    length: { minimum: 8, maximum: 10},
    format: { with: VALID_NUMBER_REGEX,
    message: "must contain only numbers."}
    
    validates :address, presence: true
    

    validates :driver_licence, presence: true,
    length: { minimum: 9, maximum: 9},
    format: { with: VALID_NUMBER_REGEX,
    message: "must contain only numbers."}
    

    # Returns the hash digest of the given string.
    def Enduser.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                              BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    # Returns a random token.
    def Enduser.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
        self.remember_token = Enduser.new_token
        update_attribute(:remember_digest, Enduser.digest(remember_token))
    end
    
    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    # Forgets a user.
    def forget
        update_attribute(:remember_digest, nil)
    end
end
