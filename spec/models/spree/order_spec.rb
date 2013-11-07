require 'spec_helper'

describe Spree::Order do
  describe '#update' do
    context 'when a order is completed products are relates as algo bought' do
      before do
        @order = FactoryGirl.create :completed_order_with_totals
        @order.finalize!
        @products = @order.products
      end

      it 'gets all related products bought' do
        product = @products.shift
        expect(product.also_bought).to eq @products
      end
    end
  end
end
