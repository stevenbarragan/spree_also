class CreateAlsoInfos < ActiveRecord::Migration
  def change
    create_table :spree_also_infos do |t|
      t.integer :count
      t.references :product, index: true
    end
  end
end
