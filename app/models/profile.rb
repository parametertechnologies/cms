class Profile < ApplicationRecord
  belongs_to :user
  attr_reader :full_name

  def full_name
    "#{first_name} #{last_name}"
  end
end
