require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'should not save article without title' do
    article = Article.new
    assert_not article.save, 'Article saved without title'
  end

  test 'should not have article title less than 5' do
    article = Article.new
    article.title = 'S'
    assert_not article.save, 'Article title saved with minimum < 5 '
  end
end
