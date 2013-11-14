require 'spec_helper'

describe Spree::Order do
  describe '#update' do
    context 'when a order is completed products are relates as algo bought' do
      let(:order){ FactoryGirl.create :completed_order_with_totals, completed_at: nil}

      before do
        order.finalize!
        @products = order.products
      end

      it 'gets all related products bought' do
        product = @products.shift
        expect(product.also_bought).to eq @products
      end

      it 'sets relation with count in one' do
        expect(Spree::AlsoBought.all.map(&:count)).to eq [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
      end
    end

    context 'when order is updated but also bought products were alredy processed' do
      let(:order){ FactoryGirl.create :completed_order_with_totals, also_bought_processed: true, completed_at: nil}

      before do
        order.finalize!
        @products = order.products
      end

      it 'does not relate products' do
        product = @products.shift
        expect(product.also_bought).to eq []
      end
    end
  end
end
