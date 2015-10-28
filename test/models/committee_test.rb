require './test/test_helper'

class CommitteeTest < ActiveSupport::TestCase
  test '#find_by committee' do
    skip
    VCR.use_cassette('committee#find_by chamber') do
      committees = Committee.find_by(chamber: 'senate')
      committee = committees.first

      assert_equal 20, committees.count
      assert_equal Committee, committee.class
      assert_equal '', committee.name
    end
  end
end
