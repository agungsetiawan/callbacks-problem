module AssetTypeService
  class CalculateAccuracy
    def initialize(asset_type)
      @asset_type = asset_type
    end

    def call
      asset_type.accuracy = calculate_accuracy
      asset_type.save!
    end

    private

    attr_reader :asset_type

    def calculate_accuracy
      if asset_type.quantity_on_hand.to_f > 0
        ((asset_type.asset_inventories.count.to_f / asset_type.quantity_on_hand.to_f) * 100).round(2)
      elsif asset_type.asset_inventories.count > 0
        asset_type.asset_inventories.count * 100
      elsif asset_type.quantity_on_hand.to_f == 0 && asset_type.asset_inventories.count == 0
        100
      else
        0
      end
    end
  end
end
