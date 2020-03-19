class AssetType < ApplicationRecord
  has_many :asset_inventories

  after_save :set_accuracy

  def set_accuracy
    update_column(:accuracy, asset_accuracy)
  end

  def asset_accuracy
    if quantity_on_hand.to_f > 0
      ((asset_inventories.count.to_f / quantity_on_hand.to_f) * 100).round(2)
    elsif asset_inventories.count > 0
      asset_inventories.count * 100
    elsif quantity_on_hand.to_f == 0 && asset_inventories.count == 0
      100
    else
      0
    end
  end
end
