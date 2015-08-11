class PromotionalRule

  def initialize discount
    @discount = discount
  end

  def get_discount basket
    store basket
    qualify? ? @discount : 0
  end

  def store basket
    @basket = basket
  end

  def qualify?
    @basket.empty? ? false : true
  end

end
