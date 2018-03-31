class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_contact, only: [:edit, :update, :destroy]
  def index
    session[:selected_group_id] = params[:group_id]
    term = params[:term]
    group_id = params[:group_id]



      @contacts = current_user.contacts.search(term).order(created_at: :desc).page(params[:page])

  end

    def autocomplete
    session[:selected_group_id] = params[:group_id]
    term = params[:term]
    group_id = params[:group_id]


      @contacts = Contact.search(term).order(created_at: :desc).page(params[:page])
      # render json: @contacts.map {|contact| {id: contact.id, value: contact.name}}
  end

  def new
    @contact = Contact.new

  end
  def edit

  end

  def update

    if @contact.update(contact_params)
      flash[:success] = "Contact was successfully updated."
      redirect_to contacts_path(previous_query_string)
      else
      flash[:danger] = @contact.errors.full_messages.to_s
      render 'edit'
    end
  end

  def destroy

     @contact = @contact.destroy
      flash[:success] = "Contact was successfully deleted."
      redirect_to contacts_path
  end

  def create
    user_reltionships(Group.find( params['contact'][:group_id]), "group")

    @contact = Contact.new(contact_params)
    if @contact.save
       user_reltionships(@contact, "contacts")
      flash[:success] = "Contact was successfully created."
      redirect_to contacts_path(previous_query_string)
    else
       flash[:danger] = @contact.errors.full_messages.to_s

      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :company, :address, :phone, :cell, :group_id, :avatar,{:user_id => []})
  end

      def user_reltionships(obj,type)
      created_user = 0

      if params['contact'][:user_id].count < 50
         error_msg = ''
         params['contact'][:user_id].each_with_index do |user, i|
          next if user == ""
          user = User.find(user)
          if type == "group"

            main_model = GroupsUser.create(group: obj, user: user)

           elsif type == "contacts"

             main_model = ContactsUser.create(contact: obj, user: user)

            end
            if main_model.errors.any?
              error_msg += ' ' + main_model.errors.full_messages.to_s
              end

            if error_msg.length > 2
            flash[:danger] = main_model.errors.full_messages.to_s
            else
          flash[:warring] =   type +" user relationship was successfully created."
         end

      end
    end
  end


  def find_contact
    @contact = Contact.find params[:id]
  end
    def g_user_params
    params.require(:contact).permit(:group, :user).merge(:user => current_user)
  end

  def previous_query_string
    session[:selected_group_id] ? {group_id: session[:selected_group_id]} : {}

  end

end
