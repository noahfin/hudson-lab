class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @property = Property.find(params[:property_id])
    @posts = @property.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
     @property = Property.find(params[:property_id])

  end

  # GET /posts/new
  def new

    @post = Post.new

  end

  # GET /posts/1/edit
  def edit
    @property = Property.find(params[:property_id])

  end

  # POST /posts
  # POST /posts.json
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


  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    @post = Post.find(params[:id])
       params[:post] = params
      @post.update_attributes(post_params)
         flash[:info] = "Post Was Updated."
          redirect_to property_path(params[:property_id])
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.


    def post_params
       params.require(:post).permit(:rating, :comment, :property_id).merge({user_id: current_user.id})
    end
end
