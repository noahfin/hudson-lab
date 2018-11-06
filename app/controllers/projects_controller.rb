class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :projected_start_time , :requirements , :budget, :resources, :description]
  before_action :authenticate_user!
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
        if @project.steps.length.zero?
      flash[:alert] = "You have no steps for this project's timeline. Create one now to get started."
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  def autocomplete
       @projects = Project.search(params[:term]).order('name ASC')
  end

  def edit
  end
  def projected_start_time
  end
  def actual_finshed_time
  end
  def requirements
  end
  def budget
  end
  def resources
  end
  def description
  end

  def development
    @projects = Project.where(["development = ?",  true ])
  end
  def maintenance
     @projects = Project.where(["maintenance = ?",  true ])
  end
  def technology
    @projects = Project.where(["technology = ?",  true ])
  end
  def business
     @projects = Project.where(["business = ?",  true ])
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      if params[:id].to_i > 0
        @project = Project.find(params[:id])
        session[:selected_project] = params[:id]
      else
        @project = Project.find(session[:selected_project])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :development, :maintenance, :projected_start_time, :technology, :business,  :projected_finish_time, :actual_start_time, :actual_finshed_time, :staffing, :resources, :requirements, :avatar,:closed)
    end
end
