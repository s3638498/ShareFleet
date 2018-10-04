=begin
    Author: Ryan Tran
    Student number: s3201690

    Vehicle model and validation
=end


class Vehicle < ApplicationRecord
    #Allow an image attachment using Active storage
    has_one_attached :image
    belongs_to :location, optional: true
    has_many :bookings, dependent: :nullify
    
    scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
    
    VALID_REGO_REGEX = /\A[A-Z0-9]*\z/
    validates :registration, presence: true, uniqueness: true,
    length: { minimum:6, maximum: 6 },
    format: { with: VALID_REGO_REGEX ,
    message: "can only contain Capital letters and digits." }
    
    validates :body, presence: true
    validates :make, presence: true
    validates :model, presence: true
    validates :odometer, presence: true, numericality: { greater_than: 0 }
    
    VALID_YEAR_REGEX = /\A[12][0-9]*\z/
    validates :year, presence: true,
    length: { minimum:4, maximum: 4 },
    format: { with: VALID_YEAR_REGEX ,
    message: "can only contain digits." }
    
    validates :colour, presence: true
    validates :status, presence: true

    def get_image
        return nil unless image.attached?
        #ActiveStorage::Blob.service.send(:path_for, image_attachment.key)
        ActionController::Base.helpers.image_tag(image)
    end

end
