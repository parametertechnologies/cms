require 'application_system_test_case'

class ArticlesTest < ApplicationSystemTestCase

  test 'listing articles' do
    visit articles_url
    assert_selector 'h2', text: 'MyString1'
    assert_selector 'h2', text: 'MyString2'
  end

  test 'creating a new article' do
    login_in_user
    visit articles_url

    click_link 'New Article'
    fill_in 'Title', with: 'Exciting Article'
    fill_in 'Text', with: 'This is a new exciting article'
    click_button 'Create Article'
    assert_selector 'h1', text: 'Exciting Article'
  end

  test 'editing a article' do
    login_in_user
    visit articles_url
    article = articles(:one)
    within("#article_#{article.id}") do
      click_link 'Edit'
    end

    fill_in 'Title', with: 'Amazing Article'
    click_button 'Update Article'
    assert_selector 'h1', text: 'Amazing Article'
  end

  test 'non-logged in can not edit an article' do
    visit articles_url
    click_link 'MyString1'
    within('#user-section') do
      assert_selector 'a', {count: 0, text: 'Edit'}
    end
  end

  test 'non-admin can not delete an article' do
    login_in_user
    visit articles_url
    click_link 'MyString1'
    within('#admin-section') do
      assert_selector 'a', {count: 0, text: 'Delete'}
    end
  end

  test 'admin can delte an article' do
    login_in_user admin: true
    visit articles_url
    click_link 'MyString1'
    within('#admin-section') do
      assert_selector 'a', text: 'Delete'
    end
  end

  private
  def login_in_user(admin: false)
    email = admin ? 'admin@email.com' :  'jason@email.com'
    pass = admin ? '125greetings' : '123greetings'

    visit articles_url
    click_link 'Log in'
    fill_in 'Email', with: email
    fill_in 'Password', with: pass
    click_button 'Log in'
  end
end
