require 'test_helper'

class AssetTypeTest < ActiveSupport::TestCase
  test "can get accuracy status, accuracy > 100" do
    asset_type = create(:asset_type, accuracy: 150)

    assert_equal "warning", asset_type.accuracy_status
  end
end
