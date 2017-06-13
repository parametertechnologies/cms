require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @site_config = SiteConfiguration.create(key: 'cms',
      settings: {title: 'My blog', tagline: 'cool site'}.to_json, user: users(:admin_user))
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
