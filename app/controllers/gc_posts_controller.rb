class GcPostsController < ApplicationController
  def new
    
    @gc_posts = GcPost.all
  end
  
  def create    
    @gc_post = GcPost.new(gc_post_params)

    size_tmp = FastImage.size(@gc_post.image)

    size = [-1, -1]    
    if (size_tmp != nil)
      size = size_tmp
    end
    
    @gc_post.image_w = size[0]
    @gc_post.image_h = size[1]

    size_tmp = FastImage.size(@gc_post.image_preview)

    size = [-1, -1]
    if (size_tmp != nil)
      size = size_tmp
    end

    @gc_post.image_preview_w = size[0]
    @gc_post.image_preview_h = size[1]

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