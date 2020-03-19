class CreateAssetInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_inventories do |t|
      t.string :status
      t.integer :asset_type_id

      t.timestamps
    end
  end
end
