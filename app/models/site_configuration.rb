class SiteConfiguration < ApplicationRecord
  belongs_to :user

  def self.cms
    find_by key: 'cms'
  end

end
