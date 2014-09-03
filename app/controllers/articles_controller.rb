class ArticlesController < ApplicationController
  def new
    # render plain: "how are you?"
    
    for i in 0..5
      puts "#{i}"
    end
    puts "run myrender"
    myrender("test")
  end
  def create
    # print "hey"
    render plain: params[:article].inspect
  end
  def myrender(render_text)
    render plain: render_text
  end
end
