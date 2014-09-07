class ArticlesController < ApplicationController
  def new
    # render plain: "how are you?"
    
    # for i in 0..5
      # puts "#{i}"
    # end
    # puts "run myrender"
    # myrender("test")
    
    @articles = Article.all
    
    # redirect_to "articles/chat"
  end
 
  def create
    # print "create new "
    # render plain: params[:article].inspect # show {"title"=>"12", "text"=>"123"}
    
    @article = Article.new(article_params)
    
    @article.save
    # redirect_to @article
    # redirect_to "http://localhost:3000/articles/new"
    # @articles = Article.all
    
    # render :template => "articles/new"
    # redirect_to "/articles/new"
    
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
