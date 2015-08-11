require 'spec_helper'
require 'utils'

describe 'utils' do
  describe ".price_to_pence" do
    it { expect( Utils.price_to_pence "£10.00" ).to eq(1000)  }
    it { expect( Utils.price_to_pence "£11" ).to eq(1100)  }
    it { expect( Utils.price_to_pence "42" ).to eq(42)  }
    it { expect( Utils.price_to_pence 14 ).to eq(14)  }
    it { expect{ Utils.price_to_pence 'ten pounds' }.to raise_error(TypeError)  }
  end

  describe ".show_price" do
    it { expect( Utils.show_price 1095 ).to eq('£10.95') }
    it { expect( Utils.show_price 95 ).to eq('£0.95') }
  end
end
