require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'should not save comment without commenter' do
    comment = new_comment(new_article)
    assert_not comment.save, 'Comment saved without commenter'
  end

  test 'should not save comment without body' do
    comment = new_comment(new_article)
    comment.commenter = 'The Dude'
    assert_not comment.save, 'Comment saved without body'
  end

  private
  def new_article
    article = Article.create(title: 'New Article', text: 'Article Text')
  end

  def new_comment(article)
    article.comments.build
  end
end
