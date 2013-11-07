require 'spec_helper'

describe Spree::AlsoBought do
  describe '#update' do
    let(:product1){ create(:product) }
    let(:product2){ create(:product) }

    before do
      described_class.update([product1,product2])
      @relation = described_class.first
    end

    it 'relates all producs' do
      expect(@relation.product1).to eq product1
      expect(@relation.product2).to eq product2
    end

    it 'sets count in one' do
      expect(@relation.count).to eq 1
    end
  end
end
