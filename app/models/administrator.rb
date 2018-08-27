class Administrator < User
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
    message: "Must contain at least one uppercase letter, one special character, one number and one lowercase letter." }
end
