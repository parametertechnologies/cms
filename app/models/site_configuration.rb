class SiteConfiguration < ApplicationRecord
  belongs_to :user

  def settings_hash
    JSON.parse(settings, symbolize_names: true) if settings
  end

  def self.cms
    find_by key: 'cms'
  end

  def self.settings_hash(site_config)
    JSON.parse(site_config.settings, symbolize_names: true) if site_config
  end
end
