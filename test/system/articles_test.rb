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

  private
  def login_in_user
    visit articles_url
    click_link 'Log in'
    fill_in 'Email', with: 'jason@email.com'
    fill_in 'Password', with: '123greetings'
    click_button 'Log in'
  end
end
