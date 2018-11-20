class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
      @post = Mainpost.find(params['comment']['mainpost_ids'])
    respond_to do |format|
      if @comment.save
          notification_str =  'Post '+ @post.body + ' was added by ' + current_user.first_name
          @notification = Notification.create(name: notification_str, thing: 'post', thing_id: @post.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
          @notification.users = User.all

       format.html
        format.json { render json: @comment}
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

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
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:title, :body, :mainpost_ids).merge({user_ids: current_user.id})
    end
end
