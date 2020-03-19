require 'test_helper'

class AssetTypeTest < ActiveSupport::TestCase
  # This test will fail
  #
  # test "can get accuracy status, accuracy > 100" do
  #   asset_type = create(:asset_type, accuracy: 150)

  #   assert_equal "warning", asset_type.accuracy_status
  # end

  test "can get accuracy status, accuracy > 100" do
    asset_type = create(:asset_type, quantity_on_hand: 1)
    create(:asset_inventory, asset_type: asset_type)
    create(:asset_inventory, asset_type: asset_type)

    assert_equal "warning", asset_type.accuracy_status
  end
end
