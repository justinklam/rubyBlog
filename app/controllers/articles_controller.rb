# Controller - class that is defined to inherit from ApplicationController
class ArticlesController < ApplicationController
  # We define methods within here to become the actions of the controller
  # index always first
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
   
    if @article.save
      redirect_to @article
    else
      # render so it doesn't reload like redirect
      render 'new'
    end
  end

  private
    def article_params
      # require/permit to prevent wrongful assignment
      params.require(:article).permit(:title, :text)
    end

end
