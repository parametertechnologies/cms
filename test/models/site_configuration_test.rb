require 'test_helper'

class SiteConfigurationTest < ActiveSupport::TestCase
  setup do
    admin = users(:admin_user)
    settings = Hash.new
    settings[:title] = 'Cool Blog'
    settings[:tagline] = 'About code'
    @site_config = SiteConfiguration.create(key: 'cms', settings: settings.to_json, user: admin )
  end

  test 'should return settings by key' do
    cms_settings = SiteConfiguration.settings_hash(SiteConfiguration.cms)
    assert_equal 'Cool Blog', cms_settings[:title]
  end

end
