require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @comment = @article.comments.create(
      {commenter: 'The Dude', body: 'The dude loved his rug.'})
    @auth_headers = {"Authorization" => "Basic #{Base64.encode64('cms:cms')}"}
  end

  teardown do
    Rails.cache.clear
  end

  test 'should POST create' do
    assert_difference('@article.comments.count') do
      post article_comments_url(@article), headers: @auth_headers,
        params: { comment: {commenter: 'The Dude', body: 'The Dude loved his rug.'}}
    end
  end

  test 'should GET edit' do
    get edit_article_comment_url(@article, @comment), headers: @auth_headers
    assert_response :success
  end

  test 'should PATCH update' do
    patch article_comment_url(@article, @comment), headers: @auth_headers,
      params: { comment: {body: 'The Dude really loves his rug.'}}

    assert_redirected_to article_path(@article)
    assert_equal 'The Dude really loves his rug.', @comment.reload.body
  end

  test 'should DELETE destroy' do
    assert_difference('@article.comments.count', -1) do
      delete article_comment_url(@article, @comment), headers: @auth_headers
    end
  end

end
