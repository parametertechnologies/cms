class CommentsController < ApplicationController

  # /articles/:article_id/comments/new
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  # /articles/:article_id/comments/:id/edit
  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    render 'articles/show'

  end

  # /articles/:article_id/comments/:id
  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to article_path(@article)
    end

  end

  # /articles/:article_id/comments/:id
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
