require 'spec_helper'
require 'promotional_rule'

describe PromotionalRule do
  subject(:promo) { PromotionalRule.new(discount) }

  let(:discount) { "10%" }
  let(:item_list) { { "001" => 2, "002" => 1 } }
  let(:current_total) { 440 }

  before(:each) do
    promo.item_list = item_list
    promo.current_total = current_total
  end

  describe "#check_discount" do
    it { expect(promo.check_discount item_list, current_total).to eq(44) }
  end

  describe "#qualify?" do
    it "returns true" do
      expect(promo.qualify?).to be(true)
    end

    context "empty basket" do
      let(:item_list) { Hash.new(0) }
      it "returns false" do
        expect(promo.qualify?).to be(false)
      end
    end
  end

  describe "#process" do

    context "invalid argument" do
      it "raises error" do
        expect{ promo.process "10" }.to raise_error(TypeError)
      end
    end

    context "cash discount" do
      it "returns discount in pence" do
        expect( promo.process "£10.00" ).to eq(1000)
      end

    end

    context "percentage discount" do
      it "returns discount in pence" do
        expect( promo.process "10%" ).to eq(44)
      end
    end
  end

end
