class Vehicle < ApplicationRecord
    #Allow multiple image attachments using Active storage
    has_many_attached :images
    
    scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
    
    VALID_REGO_REGEX = /\A[A-Z0-9]*\z/
    validates :registration, presence: true, uniqueness: true,
    length: { minimum:6, maximum: 6 },
    format: { with: VALID_REGO_REGEX ,
    message: "Can only contain Capital letters and digits." }
    
    validates :body, presence: true
    validates :make, presence: true
    validates :model, presence: true
    validates :odometer, presence: true
    validates :year, presence: true
    validates :colour, presence: true
    validates :status, presence: true
end
