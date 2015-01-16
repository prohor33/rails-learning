class GcPostsController < ApplicationController
  def new
    
    @gc_posts = GcPost.all
  end
  
  def create    
    @gc_post = GcPost.new(gc_post_params)
    @gc_post.image_w = FastImage.size(@gc_post.image)[0]
    @gc_post.image_h = FastImage.size(@gc_post.image)[1]
    @gc_post.image_preview_w = FastImage.size(@gc_post.image_preview)[0]
    @gc_post.image_preview_h = FastImage.size(@gc_post.image_preview)[1]   
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
        render :file => "gc_posts/show.json.erb", :content_type => 'application/json'
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
    params.require(:gc_post).permit(:nickname, :image, :image_w, :image_h,
     :image_preview, :image_preview_w, :image_preview_h, :text)
  end  
end