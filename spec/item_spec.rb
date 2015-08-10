require 'spec_helper'
require 'item'

describe Item do
  subject(:item) { Item.new('001', 'Lavender heart', 925) }

  describe 'initialize' do
    it { expect(item).to be_instance_of(Item) }
  end

end
