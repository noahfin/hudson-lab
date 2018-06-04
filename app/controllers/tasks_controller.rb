class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :my_contacts, only: [:edit, :create]

  # GET /tasks
  def index
    @tasks = Task.order('lower(name)').all
    respond_to do |format|
      format.html
      format.json { render json: @tasks }
       render 'index', turbolinks: true, change: 'content'
    end
  end

  # GET /tasks/1
  def show
    respond_to do |format|
      format.html
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  def new
      respond_to do |format|
    @task = Task.new
      format.html
        format.json { render json: @tasks, status: :created }
        format.js
      end
  end

  # GET /tasks/1/edit
  def edit

  end

  # POST /tasks
  def create
    @task = Task.new(task_params)


    respond_to do |format|
      if @task.save
        @tasks = Task.order('lower(name)').all
        flash[:info] = "The Action Step was successfully created."
        format.html { redirect_to '/tasks/' }
        format.json { render json: @tasks, status: :created }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
   @tasks = Task.order('lower(name)').all
    respond_to do |format|
      if @task.update(task_params)

        format.html { redirect_to @task }
        format.json { head :no_content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    respond_to do |format|
      if @task.destroy
        flash[:danger] = "The Action Step was successfully deleted."
        format.html { redirect_to tasks_url }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to tasks_url }
        format.json { render json: @task.errors, status: :forbidden }
        format.js { render status: :forbidden }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :complete, :contact_ids, :user_ids, :group_ids, :team_ids, :lead_ids, :projects_ids, :deal_ids,{:deal_ids => []}, {:group_ids => []}, {:user_ids => []},  {:team_ids => []}, {:lead_ids => []}, {:deal_ids => []})
    end

    def my_contacts
      @users = User.all

  end
end
