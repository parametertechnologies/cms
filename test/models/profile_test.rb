require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test 'create profile for user' do
    user = users(:jason)
    profile = user.create_profile(first_name: 'Jason',
                                  last_name: 'Thomas',
                                  bio: 'Everything about myself..')

    assert_equal profile.user, user, 'Profile should belong to User'
    assert_equal user.profile, profile, 'User should have one Profile'
  end
end
