=begin
    Author: Ryan Tran
    Student number: s3201690

    Administrator model extended from the User superclass
=end

class Administrator < User
    attr_accessor :remember_token
    has_many :messages

    VALID_USERNAME_REGEX = /\A[A-Za-z0-9_-]*\z/
    validates :username,
    presence: true,
    length: { minimum:3, maximum: 50 },
    format: { with: VALID_USERNAME_REGEX ,
    message: "Can only contain letters, digits, dashes and underscores." },
    uniqueness: true

    has_secure_password
    VALID_PASSWORD_REGEX =/\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()]).*\z/
    validates :password, presence: true,
    length: { minimum: 8 },
    format: { with: VALID_PASSWORD_REGEX,
    message: "Must contain at least one uppercase letter, one special character, one number and one lowercase letter." },
    allow_nil: true

    # Returns the hash digest of the given string.
    def Administrator.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                              BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def Administrator.new_token
        SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
        self.remember_token = Administrator.new_token
        update_attribute(:remember_digest, Administrator.digest(remember_token))
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
