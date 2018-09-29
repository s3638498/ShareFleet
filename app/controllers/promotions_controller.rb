class PromotionsController < ApplicationController
    def checkpromotion
        if params[:code].present? 
            promo = Promotion.where(code: params[:code]).first
            if !promo.nil?
                value = (1 - promo.amount)
            else
               value = 1
            end
            respond_to do |format|
                format.json { render json: {"value" => value}}
            end
        end 
    end
end
