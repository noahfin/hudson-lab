class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
      @post = Mainpost.find(params['comment']['mainpost_ids'])
    respond_to do |format|
      if @comment.save
      User.all.each do |user|
          notification_str =  'Post '+ @post.body + ' was added by ' + current_user.first_name
          @notification = Notification.create(name: notification_str, thing: 'post', thing_id: @post.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
          user.notifications << @notification if user.id != current_user.id
       end
       format.html
        format.json { render json: @comment}
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    comment = @comment.id
    @comment.destroy
    @comment = comment
    respond_to do |format|
     format.html
        format.json { render json: @comment}
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :body, :mainpost_ids).merge({user_ids: current_user.id})
    end
end
