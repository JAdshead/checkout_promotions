require 'utils'

class PromotionalRule

  def initialize discount
    @discount = discount
  end

  def process discount
    return discount if discount.is_a? Integer

    if discount.include?("£")
      Utils.price_to_pence(discount)

    elsif discount.include?("%")
      ( @basket.total_price / 100.0 ) * discount.sub('%','').to_f

    else
      raise(TypeError, "Needs to either be in % or £ or total pence(Integer). Example: '10%' or '£10.00'")
    end
  end

  def get_discount basket
    store basket
    qualify? ? process(@discount) : 0
  end

  def store basket
    @basket = basket
  end

  def qualify?
    @basket.empty? ? false : true
  end

end
