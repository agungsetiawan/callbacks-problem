module AssetTypeService
  class Create
    def initialize(params)
      @params = params
    end

    def call
      asset_type = AssetType.new(params)
      asset_type.accuracy = calculate_accuracy(asset_type)
      asset_type.save
    end

    private

    attr_reader :params

    def calculate_accuracy(asset_type)
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
