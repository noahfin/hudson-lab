class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @tasks = Task.order(created_at: :desc)
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
    @deals = Deal.all
    @projects = Project.all
    @properties = Property.all
    @leads = Lead.all
    respond_to do |format|
    @task = Task.new
      format.html
        format.json { render json: @tasks}
        format.js
      end
  end


  def edit

  end


  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        notification_str =  'Task '+ @task.name + ' was added by ' + current_user.first_name
        @notification = Notification.create(name: notification_str, thing: 'task', thing_id: @task.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
        @notification.users = User.all
         @tasks = Task.all.order(:name)
        if params['contact_ids']
          contacts = params['contact_ids']
          contact_array = []
          contacts.each do |contact_id|
          next if contact_id == ""
             if contact_id.to_i > 0
              contact_array.push(contact_id)
                 @task.contact_ids = contact_array
              end
           end
         end
         groups = params['task']['group_ids'].to_a
         if params['task']['group_ids']
          params['task']['group_ids'].each do |group_id|
            next if group_id == 0 || group_id == ''
            group = Group.find(group_id)
              @task.groups << group
          end
         end
         if params['task']['contact_ids']
         contacts = params['task']['contact_ids']
         contact_array = []
         contacts.each do |contact_id|
         next if contact_id == ""
          contact = Contact.find(contact_id)

             @task.contact_ids << contact
           end
         end
         if  params['task']['project_ids']
             projects = params['task']['project_ids'].to_a
             @task.projects = projects if  params['task']['projects_ids']
         end
         if params['task']['lead_ids']
             leads = params['task']['lead_ids'].to_a
             @task.leads = leads if  params['task']['leads_ids']
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
   @tasks = Task.order(created_at: :desc)
    respond_to do |format|
      if @task.update(task_params)

        notification_str =  'Task '+ @task.name + ' was updated by ' + current_user.first_name
        @notification = Notification.create(name: notification_str, thing: 'task', thing_id: @task.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
        @notification.users = User.all

        format.html { redirect_to '/tasks/' }
        format.json { render json: @tasks, status: :updated }
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
      params.require(:task).permit(:name, :complete, :personal, :contact_ids, :user_ids, :group_ids, :team_ids, :lead_ids, :property_ids, :project_ids, :deal_ids,{:deal_ids => []}, {:group_ids => []}, {:user_ids => []},  {:team_ids => []}, {:lead_ids => []}, {:deal_ids => []}, {:contact_ids => []}, {:project_ids => []}, {:property_ids => []})
    end


end
