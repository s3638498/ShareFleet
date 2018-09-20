class Discount < ApplicationRecord
    
      def generate_discount_code
    
    rand(1000..9999)
     end
end
