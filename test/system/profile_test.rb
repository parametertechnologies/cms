require 'application_system_test_case'

class ProfileTest < ApplicationSystemTestCase

  test 'showing user profile for non-logged in user' do
    visit profile_url
    assert_selector 'a', {count: 0, text: 'Edit your profile'}
  end

  test 'showing user profile for logged in user' do
    ### need to modify this behavior so if the logged in user owns this
    ## profile than they can edit the profile..
    ## todo also add a cms_configuration model and table that contains:
    ## cms_title, cms_tagline, cms_owner_user (has_one relationship to user)
    login_in_user
    visit profile_url
    assert_selector 'a', text: 'Edit your profile'
  end
end
