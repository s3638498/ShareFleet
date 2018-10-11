class Booking < ApplicationRecord
    require 'date'
    belongs_to :vehicle, optional: true
    belongs_to :user, optional: true
    
    validates_datetime :pickup_time, 
        presence: true, 
        :on_or_before => :expected_dropoff_time,
        :on_or_before_message => 'must be before drop off time.',
        :on_or_after => DateTime.now,
        :on_or_after_message => 'cannot be in the past.'
        
    validates_datetime :expected_dropoff_time, 
     presence: true, 
        :on_or_after => :pickup_time,
        :on_or_after_message => 'must be after pickup time.'
        
    validates :vehicle, presence: true
    validates :user, presence: true
    validates :total, presence: true, numericality: { greater_than: 0 }
end
