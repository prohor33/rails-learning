class ArticlesController < ApplicationController
  def new
  end
  def create
    # print "hey"
    render plain: params[:article].inspect
  end
end
