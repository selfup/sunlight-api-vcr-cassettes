require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  test '#legislators' do
    VCR.use_cassette("sunlight_service#legislators") do
      legislators = SunlightService.new.legislators(gender: 'F')
      legislator = legislators.first

      assert_equal 20, legislators.count
      assert_equal 'Joni', legislator["first_name"]
      assert_equal 'Ernst', legislator["last_name"]
    end
  end
end
