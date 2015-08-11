require 'promotional_rule'

class ItemPromotion < PromotionalRule

  def initialize discounted_item, min_item_quantity, discount
    @discounted_item = discounted_item
    @min_item_quantity = min_item_quantity
    @discount = discount
    @basket
  end

  def get_discount basket
    store_basket = basket
    super.to_i * item_quantity
  end

  def store_basket basket
    @basket = basket
  end

  def qualify?
    if item_quantity >= @min_item_quantity.to_i
      true
    else
      false
    end
  end

  def item_quantity
    @basket.list_items[@discounted_item].to_i
  end

end
