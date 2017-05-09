require 'application_system_test_case'

class ArticlesTest < ApplicationSystemTestCase

  test 'listing articles' do
    visit articles_url
    assert_selector 'h2', text: 'MyString1'
    assert_selector 'h2', text: 'MyString2'
  end

  test 'creating a new article' do
    basic_auth!
    visit articles_url
    click_link 'New Article'
    fill_in 'Title', with: 'Exciting Article'
    fill_in 'Text', with: 'This is a new exciting article'
    click_button 'Create Article'
    assert_selector 'h1', text: 'Exciting Article'
  end

  private
  def basic_auth!
    visit 'http://cms:cms@127.0.0.1/articles/new'
  end
end
