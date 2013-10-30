module Spree
  class AlsoBought < ActiveRecord::Base
    belongs_to :product1, class_name: 'Spree::Product'
    belongs_to :product2, class_name: 'Spree::Product'
  end
end
