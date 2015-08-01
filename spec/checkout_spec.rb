require 'spec_helper'
require_relative '../lib/checkout'

describe Checkout do
  subject(:checkout) { Checkout.new }

  describe "initializes checkout with promo rules"
  describe "#scan"
  describe "#total"
end
