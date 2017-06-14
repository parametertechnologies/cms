require 'application_system_test_case'

class SiteConfigurationTest < ApplicationSystemTestCase
  setup do
    login_in_user admin: true
    site_config = SiteConfiguration.create(key: 'cms',
      settings: {title: 'Cool Blog', tagline: 'Having fun'}.to_json, user: users(:admin_user))
  end

  test 'admin user accessing site configuration' do
    visit home_url
    click_link 'Configure Site'
    assert_selector 'h1', text: 'Configure Site'
  end

  test 'listing site configurations' do
    visit site_configurations_url
    assert_selector 'h2', text: 'cms'
  end

end
