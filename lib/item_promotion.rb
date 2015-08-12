require 'promotional_rule'

# updated for Item Promotion rules
class ItemPromotion < PromotionalRule

  def initialize discounted_item, min_item_quantity, discount
    @discounted_item = discounted_item
    @min_item_quantity = min_item_quantity
    @discount = discount
  end

  def check_discount item_list, current_total
    super.to_i * @item_list[@discounted_item]
  end

  def qualify?
    if @item_list[@discounted_item] >= @min_item_quantity.to_i
      true
    else
      false
    end
  end

end
