require 'promotional_rule'

class BasketPromotion < PromotionalRule

  def initialize min_basket_price, discount
    @min_basket_price = Utils.price_to_pence(min_basket_price)
    @discount  = discount
  end

  # method changed to allow for different promotional rule.
  def qualify?
    if @current_total > @min_basket_price.to_i
      true
    else
      false
    end
  end

end
