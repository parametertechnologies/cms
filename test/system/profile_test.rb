require 'application_system_test_case'

class ProfileTest < ApplicationSystemTestCase

  test 'showing user profile for non-logged in user' do
    visit profile_url
    assert_selector 'a', {count: 0, text: 'Edit your profile'}
  end

  test 'showing user profile for logged in user' do
    login_in_user
    visit profile_url
    assert_selector 'a', text: 'Edit your profile'
  end
end
