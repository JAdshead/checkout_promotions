require 'promotional_rule'

class BasketPromotion < PromotionalRule

  def initialize min_basket_price, discount
    @min_basket_price = min_basket_price
    @discount  = discount
  end

  def qualify?
    if @basket.total_price > @min_basket_price.to_i
      true
    else
      false
    end
  end

end
