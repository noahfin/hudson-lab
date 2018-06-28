class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 protect_from_forgery null_session: [:create, :update  ]
   before_action :authenticate_user!
  def index
    @property = Property.find(params[:property_id])
     @deal = Deal.find(params[:deal_id])
    @posts = @property.posts
  end

  def show
     @property = Property.find(params[:property_id])
      @deal = Deal.find(params[:deal_id])

  end

  def new
    @post = Post.new
  end

  def edit
    @property = Property.find(params[:property_id])
     @deal = Deal.find(params[:deal_id])

  end

  def create
    @property = Property.find(params[:property_id]) unless params[:deal_id]

    @deal = Deal.find(params[:deal_id])
    params['post'] = params
    @post = Post.new(post_params)
      if @post.save
      flash[:info] = "Post was created."
              if params[:deal_id]

       redirect_to deal_path( params[:deal_id] )
     elsif  params[:property_id]
      redirect_to porperty_path( params[:property_id] )
    end
      else
        flash[:danger] = "Post was not created."
        if params[:deal_id]

       redirect_to deal_path( params[:deal_id] )
     elsif  params[:property_id]
      redirect_to porperty_path( params[:property_id] )
    end
    end
  end


  def update
    @post = Post.find(params[:id])
       params[:post] = params
    @post.update_attributes(post_params)
       flash[:info] = "Post Was Updated."

  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to property_path(params[:property_id]), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
       params.require(:post).permit(:post, :rating, :comment, :deal_id, :utf8, :authenticity_token, :property_id, :comment_id).merge({user_id: current_user.id})
    end

end
