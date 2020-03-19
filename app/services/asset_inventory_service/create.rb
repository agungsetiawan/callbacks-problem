module AssetInventoryService
  class Create
    def initialize(params)
      @params = params
    end

    def call
      asset_inventory = AssetInventory.new(params)

      asset_inventory.transaction do
        asset_inventory.save!
        asset_type = asset_inventory.asset_type
        AssetTypeService::CalculateAccuracy.new(asset_type).call
      end
    end

    private

    attr_reader :params
  end
end
