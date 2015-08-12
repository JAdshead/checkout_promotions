require 'utils'

# superclass for for promotional rules
# I decided to split the promotional rules into different classes to allow
# for a simpler addition of promotional rules with the PromotionalRule class providing the
# core functionality and each subclass being modified to fit the Rule

class PromotionalRule
  attr_accessor :item_list, :current_total

  def initialize discount
    @discount = discount
  end

  # parse string to total discount.
  # I decided that future promotional rules might mix and match % or £ discounts
  def process discount
    return discount if discount.is_a? Integer

    if discount.include? "£"
      Utils.price_to_pence discount

    elsif discount.include? "%"
      ( @current_total / 100.0 ) * discount.sub('%','').to_f

    else
      raise(TypeError, "Needs to either be in % or £ or total pence(Integer). Example: '10%' or '£10.00'")
    end
  end

  def check_discount item_list, current_total
    self.item_list = item_list
    self.current_total = current_total

    qualify? ? process(@discount) : 0
  end

  def qualify?
    @item_list.empty? ? false : true
  end

end
