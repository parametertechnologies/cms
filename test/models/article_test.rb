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

  test 'should return all articles' do
    all = Article.all
    assert_equal 4, all.length, 'Should return 4 articles'
  end

  test 'should return highlighted articles' do
    highlighted = Article.highlighted
    assert_equal 2, highlighted.length, 'Should return 2 highlighted articles'
  end

  test 'recent articles should not include highlighted' do
    recent = Article.recent
    assert_equal 2, recent.length, 'Should return 2 recent articles'
  end
end
