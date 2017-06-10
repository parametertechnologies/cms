require 'application_system_test_case'

class ProfileTest < ApplicationSystemTestCase

  test 'showing profile to non-logged in user' do
    visit profile_url
    assert_selector 'a', {count: 0, text: 'Edit your profile'}
  end

  test 'showing edit profile link for logged in admin user' do
    login_in_user admin: true # todo change admin attribute to site_owner
    visit profile_url
    assert_selector 'a', text: 'Edit your profile'
  end

  test 'not showing edit profile link for logged in non admin user' do
    login_in_user
    visit profile_url
    assert_selector 'a', {count: 0, text: 'Edit your profile'}
  end
end


## Notes
# Change Profile (Controller, Model, etc) to About
# Change Admin role to Site_Owner (should be only one site owner)
# Create a configure CMS section so Site owner can configure title, tag-line, etc
# User should have a 1:1 relationship to cms configuration model for the site_owner relationship
# Once markdown support is add, remove html_safe from app/views/profiles/show.html.erb
