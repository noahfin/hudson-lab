class MainpostsController < ApplicationController
  before_action :set_mainpost, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /mainposts
  # GET /mainposts.json
  def index
    @mainposts = Mainpost.all
  end

  # GET /mainposts/1
  # GET /mainposts/1.json
  def show
  end

  # GET /mainposts/new
  def new
    @mainpost = Mainpost.new
  end

  # GET /mainposts/1/edit
  def edit
  end

  # POST /mainposts
  # POST /mainposts.json
  def create
    @post = Mainpost.new(mainpost_params)
    @deal = Deal.find(params['mainpost']['deal_ids'])
    @comment = Comment.new

    respond_to do |format|
      if @post.save
     format.html
        format.json { render json: @post}
        format.js
      else
           format.html
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /mainposts/1
  # PATCH/PUT /mainposts/1.json
  def update
    respond_to do |format|
      if @mainpost.update(mainpost_params)
        format.html { redirect_to @mainpost, notice: 'Mainpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @mainpost }
      else
        format.html { render :edit }
        format.json { render json: @mainpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mainposts/1
  # DELETE /mainposts/1.json
  def destroy
    @mainpost.destroy
    respond_to do |format|
      format.html { redirect_to mainposts_url, notice: 'Mainpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mainpost
      @mainpost = Mainpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mainpost_params
      params.require(:mainpost).permit(:body, :deal_ids).merge({user_ids: current_user.id})
    end
end
