module Spree
  class AlsoBought < ActiveRecord::Base
    belongs_to :product1, class_name: 'Spree::Product'
    belongs_to :product2, class_name: 'Spree::Product'

    # Increment count in all AlsoBougths products combinations
    def self.update(products)
      products.combination(2).each do |product1,product2|
        also = Spree::AlsoBought.where("product1_id IN (?) AND product2_id IN (?)", [product1.id,product2.id], [product1.id,product2.id]).first
        also ? also.increment!(:count) : Spree::AlsoBought.create(product1: product1, product2: product2)
      end
    end
  end
end
