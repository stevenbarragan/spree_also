Spree::Order.class_eval do
  register_update_hook :update_also_bought

  def update_also_bought
    if completed? && !also_bought_processed
      self.update(also_bought_processed: true)
      Spree::AlsoBought.update(products)
    end
  end
end

