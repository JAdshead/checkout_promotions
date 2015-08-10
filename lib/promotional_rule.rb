class PromotionalRule
  attr_reader :qualification, :discounted, :amount

  def initialize qualification, discounted, amount
    @qualification = qualification
    @discounted = discounted
    @amount = amount
  end

  def qualify?

  end

end
