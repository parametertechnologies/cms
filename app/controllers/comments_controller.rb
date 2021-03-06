class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def edit
    @comment = @article.comments.find(params[:id])
    render 'articles/show'

  end

  def update
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to article_path(@article)
    end

  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
