class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # @comment auto links association through .create
    @comment = @article.comments.create(comment_params)
    # calls the show view
    redirect_to article_path(@article)
  end
 
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