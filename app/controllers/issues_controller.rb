class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :set_property
  before_action :authenticate_user!


  # GET /issues
  # GET /issues.json
  def index

    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show

  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    params[:issue] = params
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
         flash[:info] = "Issue was successfully created."
        format.html { redirect_to property_path(@property)}
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    params[:issue] = params
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to property_issue_path, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        flash[:danger] = "Make Sure all parts of the form are filled out"
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end
    def set_property
      @property = Property.find(params[:property_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:severity, :status, :comment, :property_id).merge({user_id: current_user.id})
    end
end
