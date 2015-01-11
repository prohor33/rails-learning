class PostGcsController < ApplicationController
  def new
    
    @post_gcs = PostGc.all
  end
  
  def create    
    @post_gc = PostGc.new(post_gc_params)   
    @post_gc.save
    
    redirect_to "/post_gcs/new"
  end
  
  # for debug
  def show
    respond_to do |format|
      # ... other formats here ...
      
      format.jsonr do
        # call http://localhost:3000/post_gcs/checkname.jsonr
        
        @post_gcs = PostGc.all
        postlist = @post_gcs.each do |post_gc|
           {
            :username => post_gc.username,
            :img_url => post_gc.img_url,
            :text => post_gc.text,
          }
        end
        render :json => postlist.to_json
      end      
    end
  end
  
  private
  def post_gc_params
    params.require(:post_gc).permit(:username, :img_url, :text)
  end  
end
