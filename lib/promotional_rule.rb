class PromotionalRule

  def initialize discount
    @discount = discount
  end

  def get_discount basket
    qualify?(basket) ? @discount : 0
  end

  def qualify? basket
    basket.empty? ? false : true
  end

end
