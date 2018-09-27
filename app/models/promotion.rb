class Promotion < ApplicationRecord
    validates :code, presence: true
    validates :amount, presence: true, numericality: { greater_than: 0, less_than: 1  }
end
