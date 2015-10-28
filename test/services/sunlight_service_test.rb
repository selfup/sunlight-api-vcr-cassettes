require './test/test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service ||= SunlightService.new
  end

  test '#legislators' do
    VCR.use_cassette("sunlight_service#legislators gender") do
      legislators = service.legislators(gender: 'F')
      legislator = legislators.first

      assert_equal 20, legislators.count
      assert_equal 'Joni', legislator["first_name"]
      assert_equal 'Ernst', legislator["last_name"]
    end
  end

  test '#legislators chamber' do
    VCR.use_cassette("sunlight_service#legislators chamber") do
      legislators = service.legislators(chamber: 'senate')
      legislator = legislators.first

      assert_equal 20, legislators.count
      assert_equal 'Benjamin', legislator["first_name"]
      assert_equal 'Sasse', legislator["last_name"]
    end
  end

  test '#committee subcommittee' do
    VCR.use_cassette("sunlight_service#committee subcommittee") do
      committees = service.committees(chamber: 'senate')
      committee = committees.first

      assert_equal 20, committees.count
      assert_equal 'Regulatory Affairs and Federal Management', committee["name"]
    end
  end
end
