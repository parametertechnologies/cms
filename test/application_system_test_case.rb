require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  protected
  def login_in_user(admin: false)
    email = admin ? 'admin@email.com' :  'jason@email.com'
    pass = admin ? '125greetings' : '123greetings'

    visit home_url
    click_link 'Log in'
    fill_in 'Email', with: email
    fill_in 'Password', with: pass
    click_button 'Log in'
  end
end
