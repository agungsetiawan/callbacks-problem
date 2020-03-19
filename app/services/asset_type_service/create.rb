module AssetTypeService
  class Create
    def initialize(params)
      @params = params
    end

    def call
      asset_type = AssetType.new(params)

      asset_type.transaction do
        asset_type.save!
        AssetTypeService::CalculateAccuracy.new(asset_type).call
      end
    end

    private

    attr_reader :params
  end
end
