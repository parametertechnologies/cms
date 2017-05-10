require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @article = articles(:one)
    @user = users(:jason)
    sign_in @user
  end

  teardown do
    Rails.cache.clear
    Warden.test_reset!
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
    get new_article_url
    assert_response :success
  end

  test 'should GET edit' do
    get edit_article_url(@article)
    assert_response :success
  end

  test 'should POST create' do
    assert_difference('Article.count') do
      post articles_url, params: { article: {title: "New Title", text: "Text"}}
    end
  end

  test 'should PATCH update' do
    patch article_url(@article), params: { article: { title: 'Updated' } }

    assert_redirected_to article_path(@article)
    assert_equal 'Updated', @article.reload.title
  end

  test 'should DELETE destroy' do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

  end
end
