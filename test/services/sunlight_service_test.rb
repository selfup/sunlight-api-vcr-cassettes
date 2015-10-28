require 'test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  test '#legislators' do
    legislators = SunlightService.new.legislators(gender: 'F')
    legislators.first

    assert_count 0, legislators.count
  end
end
