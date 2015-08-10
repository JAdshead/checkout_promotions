class PromotionalRule

  def initialize options = {}
    @minimum_basket_price = options[:min_basket_price]
  end

  def get_discount basket
    qualify?(basket) ? 100 : 0
  end

  def qualify? basket
    if basket.total_price > @minimum_basket_price.to_i
      true
    else
      false
    end
  end

end
