class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.order('lower(name)').all
    respond_to do |format|
      format.html
      format.json { render json: @tasks }
       render 'index', turbolinks: true, change: 'content'
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @task }
    end
  end

  def new
    respond_to do |format|
    @task = Task.new
      format.html
        format.json { render json: @tasks, status: :created }
        format.js
      end
  end


  def edit

  end


  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
         @tasks = Task.order('lower(name)').all
        if  @task.group_ids = params['task']['group_ids']
           if  @task.contact_ids = params['task']['contact_ids']
           end
        end
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

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :complete, :contact_ids, :user_ids, :group_ids, :team_ids, :lead_ids, :projects_ids, :deal_ids,{:deal_ids => []}, {:group_ids => []}, {:user_ids => []},  {:team_ids => []}, {:lead_ids => []}, {:deal_ids => []}, {:contact_ids => []}, {:projects_ids => []})
    end


end
