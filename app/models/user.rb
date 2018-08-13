class User < ApplicationRecord
  has_secure_password
  
  validates :username,
            presence: true,
            length: { minimum: 2 },
            uniqueness: { case_sensitive: false }
   
  validates :password, 
	    length: { minimum: 8 }

  validates :first_name, :last_name, 
	    presence: true, 
	    length: { minimum: 2 },
	    format: { with: /\A[a-zA-Z]+\z/ }

  validates :date_of_birth, :email, :contact_number, :address, :driver_licence,  presence: true

end
