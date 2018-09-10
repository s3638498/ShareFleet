class Message < ApplicationRecord
  belongs_to :administrator
  belongs_to :enduser

  validates :content, presence: true, allow_blank: false
end
