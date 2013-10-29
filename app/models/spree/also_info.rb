module Spree
  class AlsoInfo < ActiveRecord::Base
    belongs_to :product
  end
end
