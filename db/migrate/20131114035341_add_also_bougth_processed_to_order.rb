class AddAlsoBougthProcessedToOrder < ActiveRecord::Migration
  def change
    add_column :spree_orders, :also_bought_processed, :boolean
  end
end
