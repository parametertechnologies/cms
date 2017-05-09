require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase

  test 'login in user' do
    visit articles_url
    click_link 'Log in'
    assert_selector 'h2', text: 'Log in'

    fill_in 'Email', with: 'jason@email.com'
    fill_in 'Password', with: '123greetings'
    click_button 'Log in'

    assert_selector 'div', text: 'Signed in successfully.'
  end

end
