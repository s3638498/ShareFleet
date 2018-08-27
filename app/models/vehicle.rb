class Vehicle < ApplicationRecord
    #Allow multiple image attachments using Active storage
    has_many_attached :images
    
    scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
end
