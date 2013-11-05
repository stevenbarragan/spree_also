Spree::Order.class_eval do
  register_update_hook :update_also_bought

  def update_also_bought
   Spree::AlsoBought.update(products) if completed?
  end
end

