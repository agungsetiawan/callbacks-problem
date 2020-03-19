class AssetInventory < ApplicationRecord
  belongs_to :asset_type

  after_save :update_asset_accuracy

  def update_asset_accuracy
    asset_type.set_accuracy
  end
end
