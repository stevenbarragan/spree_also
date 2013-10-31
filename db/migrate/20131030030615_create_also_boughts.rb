class CreateAlsoBoughts < ActiveRecord::Migration
  def change
    create_table :spree_also_boughts do |t|
      t.integer :count, default: 1
      t.references :product1, index: true
      t.references :product2, index: true
    end
  end
end
