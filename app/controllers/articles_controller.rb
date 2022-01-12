# Controller - class that is defined to inherit from ApplicationController
class ArticlesController < ApplicationController
  # We define methods within here to become the actions of the controller
  
  def new
  end

  def create
    # render taking in hash of plain and value of params[:article].inspect
    # params method is the object which represents the parameters(or fields) coming in from the form ie. actual username/email

    # require/permit to prevent wrongful assignment
    @article = Article.new(params.require(:article).permit(:title, :text))
     
    # save to db
    @article.save
    redirect_to @article  
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
