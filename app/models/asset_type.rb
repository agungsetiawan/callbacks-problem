class AssetType < ApplicationRecord
  has_many :asset_inventories

  def accuracy_status
    if accuracy > 100
      'warning'
    elsif accuracy >= 80 && accuracy <= 100
      'success'
    else accuracy < 80
      'danger'
    end
  end
end
