class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @property = Property.find(params[:property_id])
    @posts = @property.posts
  end

  def show
     @property = Property.find(params[:property_id])

  end

  def new
    @post = Post.new
  end

  def edit
    @property = Property.find(params[:property_id])

  end

  def create
    @property = Property.find(params[:property_id])
    params[:post] = params
    @post = Post.new(post_params)
      if @post.save
      flash[:info] = "Post was created."
      redirect_to property_path(@property)
      else
        flash[:danger] = "Post was not created."
        render :new
    end
  end


  def update
    @post = Post.find(params[:id])
       params[:post] = params
    @post.update_attributes(post_params)
       flash[:info] = "Post Was Updated."
       redirect_to property_path(params[:property_id])
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
       params.require(:post).permit(:rating, :comment, :property_id).merge({user_id: current_user.id})
    end

end
