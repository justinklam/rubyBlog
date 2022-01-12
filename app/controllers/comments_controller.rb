class CommentsController < ApplicationController

  # only allows authenticated users to delete comments
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    # @comment auto links association through .create
    @comment = @article.comments.create(comment_params)
    # calls the show view
    redirect_to article_path(@article)
  end
 
  # find the article we're looking at, locate comment within the collection for that article, remove it from database and then redirect to show
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