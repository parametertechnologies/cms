require 'test_helper'

class SiteConfigurationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:admin_user)
    sign_in @admin
    @site_config = SiteConfiguration.create(key: 'cms',
      settings: {title: 'Blog', tagline: 'cool'}.to_json , user: @admin)
  end

  teardown do
    Rails.cache.clear
    Warden.test_reset!
  end

  test 'should GET index' do
    get site_configurations_url
    assert_response :success
  end

  test 'should GET show' do
    get site_configuration_url(@site_config)
    assert_response :success
  end

  test 'should GET new' do
    get new_site_configuration_url
    assert_response :success
  end

  # test "should POST create" do
  #
  # end

  test "should GET edit" do
    get edit_site_configuration_url(@site_config)
    assert_response :success
  end

  # test "should PATCH update" do
  #
  # end

  # test "should DELETE destroy" do
  #
  # end

end
