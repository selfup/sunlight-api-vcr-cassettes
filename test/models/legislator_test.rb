require './test/test_helper'

class LegislatorTest < ActiveSupport::TestCase
  test '#find_by gender' do
    VCR.use_cassette('legislator#find_by gender') do
      legislators = Legislator.find_by(gender: 'F')
      legislator = legislators.first

      assert_equal 20, legislators.count
      assert_equal Legislator, legislator.class
      assert_equal 'Joni', legislator.first_name
      assert_equal 'Ernst', legislator.last_name
    end
  end

  test '#find_by chamber' do
    VCR.use_cassette('legislator#find_by chamber') do
      legislators = Legislator.find_by(chamber: 'senate')
      legislator = legislators.first

      assert_equal 20, legislators.count
      assert_equal Legislator, legislator.class
      assert_equal 'Benjamin', legislator.first_name
      assert_equal 'Sasse', legislator.last_name
    end
  end
end
