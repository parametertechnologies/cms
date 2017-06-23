require 'application_system_test_case'

class SiteConfigurationTest < ApplicationSystemTestCase
  setup do
    login_in_user admin: true
    @site_config = SiteConfiguration.create(key: 'cms',
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

  test 'viewing site configuration' do
    visit site_configurations_url
    click_link 'cms'
    assert_selector 'p', text: 'Cool Blog'
    assert_selector 'p', text: 'Having fun'
  end

  test 'editing site configuration' do
    visit site_configuration_url(@site_config)
    click_link 'Edit'

    fill_in 'site_configuration[settings][title]', with: 'My Very Cool Blog'
    click_button 'Update Site configuration'
    assert_selector 'p', text: 'My Very Cool Blog'
  end
end
