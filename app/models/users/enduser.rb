class EndUser < User
    VALID_USERNAME_REGEX = /\A[A-Za-z0-9_-]{2,15}\z/
    validates :username,  
    presence: true, 
    length: { minimum:3 },
    format: { with: VALID_USERNAME_REGEX ,
    message: "Can only contain letters, digits, dashes and underscores." },
    uniqueness: true
    
    
    VALID_PASSWORD_REGEX =/\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()]).*\z/
    validates :password_checksum, presence: true,
    length: { minimum: 8 }, 
    format: { with: VALID_PASSWORD_REGEX,
    message: "Must contain at least one uppercase letter, one special character, one number and one lowercase letter." }
    
    validates :first_name, presence: true,
    length: { minimum: 2 }
    
    validates :last_name, presence: true,
    length: { minimum: 2 }
    
    validates :date_of_birth, presence: true
    
    validates :email, presence: true
    

    validates :contact_number, presence: true
    
    validates :address, presence: true
    

    validates :driver_licence, presence: true
end
