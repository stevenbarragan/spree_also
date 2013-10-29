require 'spec_helper'

describe Spree::Order do
  describe '#update' do
    context 'when a order is completed products are relates as algo bought' do
      before do
        @order = FactoryGirl.create :completed_order_with_totals
        @products = @order.line_items.map{ |line_item| line_item.product }
      end

      it 'relates all products bought' do
        product = @products.shift
        expect(product.also_bought).to eq product
      end
    end
  end
end
