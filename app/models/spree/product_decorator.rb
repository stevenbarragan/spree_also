Spree::Product.class_eval do
  def also_bought(product2_id = id)
    Spree::AlsoBought.where("product1_id IN (?) OR product2_id IN (?)", [id,product2_id], [id,product2_id])
  end
end
