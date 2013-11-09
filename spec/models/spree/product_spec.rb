require 'spec_helper'

describe Spree::Product do
  describe '#also_bought' do
    let(:product1){ create(:product) }
    let(:product2){ create(:product) }
    let(:product3){ create(:product) }
    let(:product4){ create(:product) }

    before do
      Spree::AlsoBought.update [product1,product2,product3,product4]
      Spree::AlsoBought.update [product1,product2,product3]
      Spree::AlsoBought.update [product1,product2]
    end

    it 'returns all also bought products sorted by quantity' do
      expect(product1.also_bought).to eq [product2, product3, product4]
      expect(product2.also_bought).to eq [product1, product3, product4]
      expect(product4.also_bought).to eq [product1, product2, product3]
    end
  end
end
