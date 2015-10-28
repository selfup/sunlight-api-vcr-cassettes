require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  test '#legislators' do
    VCR.use_cassette("sunlight_service#legislators") do
      legislators = SunlightService.new.legislators(gender: 'F')
      legislators.first

      assert_equal 20, legislators.count
    end
  end
end
