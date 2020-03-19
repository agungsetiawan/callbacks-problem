class CreateAssetTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_types do |t|
      t.string :name
      t.integer :quantity_on_hand
      t.decimal :accuracy

      t.timestamps
    end
  end
end
