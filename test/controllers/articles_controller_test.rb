require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @article = articles(:one)
    @auth_headers = {"Authorization" => "Basic #{Base64.encode64('cms:cms')}"}
  end

  teardown do
    Rails.cache.clear
  end

  test 'should GET index' do
    get articles_url
    assert_response :success
  end

  test 'should GET show' do
    get article_url(@article)
    assert_response :success
  end

  test 'should GET new' do
    get new_article_url, headers: @auth_headers
    assert_response :success
  end

  test 'should GET edit' do
    get edit_article_url(@article), headers: @auth_headers
    assert_response :success
  end

  test 'should POST create' do
    assert_difference('Article.count') do
      post articles_url, headers: @auth_headers,
        params: { article: {title: "New Title", text: "Text"}}
    end
  end

  test 'should PATCH update' do
    patch article_url(@article), headers: @auth_headers,
      params: { article: { title: 'Updated' } }
    assert_redirected_to article_path(@article)

    @article.reload
    assert_equal 'Updated', @article.title
  end
end
