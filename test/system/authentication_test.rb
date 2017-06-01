require 'application_system_test_case'

class AuthenticationTest < ApplicationSystemTestCase

  test 'login in user' do
    visit home_url
    click_link 'Log in'
    assert_selector 'h2', text: 'Log in'
    login_in_user
    assert_selector 'div', text: 'Signed in successfully.'
  end

  test 'log out user' do
    visit home_url
    click_link 'Log in'
    login_in_user
    click_link 'Log out'
    assert_selector 'div', text: 'Signed out successfully.'
  end

  private
  def login_in_user
    fill_in 'Email', with: 'jason@email.com'
    fill_in 'Password', with: '123greetings'
    click_button 'Log in'
  end

end
