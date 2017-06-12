require 'application_system_test_case'

class SiteConfigurationTest < ApplicationSystemTestCase
  test 'admin user accessing site configuration' do
    login_in_user admin: true
    visit home_url
    click_link 'Configure Site'
    assert_selector 'h1', text: 'Configure Site'
  end

end
