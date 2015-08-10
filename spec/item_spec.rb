require 'spec_helper'
require 'item'

describe Item do
  subject(:item) { Item.new('001', 'Lavender heart', 925) }

  describe 'initialize' do
    it { expect(item).to be_instance_of(Item) }
  end

  describe '#process_csv' do
    it { expect(Item.process_csv.count).to eq(3) }
    it { expect(Item.process_csv.first.name).to eq("Lavender heart")  }
  end

  describe '#find' do
    it { expect(Item.find('001').name).to eq("Lavender heart") }
    it { expect(Item.find('002').name).to eq("Personalised cufflinks") }
  end

end
