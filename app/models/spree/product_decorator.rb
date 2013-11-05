Spree::Product.class_eval do
  def also_bought
    Spree::Product.joins('INNER JOIN spree_also_boughts ON (product1_id = spree_products.id OR product2_id= spree_products.id)')
        .where.not(id: self)
        .order('spree_also_boughts.count DESC')
        .uniq
  end
end
