class GcPostsController < ApplicationController
  def new
    
    @gc_posts = GcPost.all
  end
  
  def create    
    @gc_post = GcPost.new(gc_post_params)   
    @gc_post.save
    
    redirect_to "/gc_posts/new"
  end
  
  # for debug
  def show
    respond_to do |format|
      # ... other formats here ...
      
      format.jsonr do
        # call http://localhost:3000/gc_posts/checkname.jsonr
        
        @gc_posts = GcPost.all
        postlist = @gc_posts.each do |gc_post|
           {
            :nickname => gc_post.nickname,
            :image => gc_post.image,
            :image_preview => gc_post.image_preview,
            :text => gc_post.text,
            :id => gc_post.id
          }
        end
        render :json => postlist.to_json
      end      
    end
  end
  
  def destroy
    @gc_posts = GcPost.all
    @gc_posts.find(params[:id]).destroy
    
    redirect_to "/gc_posts/new"
  end
  
  private
  def gc_post_params
    params.require(:gc_post).permit(:nickname, :image, :image_preview, :text)
  end  
end