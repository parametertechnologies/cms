require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @site_config = SiteConfiguration.create(key: 'cms',
      title: 'My blog', tagline: 'cool site', user: users(:admin_user))
  end

  test 'should get show' do
    get profile_url
    assert_response :success
  end

  test 'should get edit' do
    get edit_profile_url
    assert_response :success
  end

end
