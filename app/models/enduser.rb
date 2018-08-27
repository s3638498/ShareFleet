class Enduser < User
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
    message: "Must contain only numbers."}
    
    validates :address, presence: true
    

    validates :driver_licence, presence: true,
    length: { minimum: 9, maximum: 9},
    format: { with: VALID_NUMBER_REGEX,
    message: "Must contain only numbers."}
end
