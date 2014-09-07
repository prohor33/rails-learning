class ArticlesController < ApplicationController
  def new
    
    @articles = Article.all
  end
 
  def create    
    @article = Article.new(article_params)   
    @article.save
    
    redirect_to "/articles/new"
  end
  
  def chat
    @articles = Article.all
  end
  
  def myrender(render_text)
    render plain: render_text
  end
  
  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:nickname, :message)
  end

end
