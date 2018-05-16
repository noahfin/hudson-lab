class ContactsController < ApplicationController
  include ContactsHelper
  before_action :find_contact, only: [:edit, :update, :destroy, :show]
  before_action :my_contacts, only: [:edit  ]

  def index
    @contact = Contact.new
    session[:selected_group_id] = params[:group_id]
    if params[:group_id] && !params[:group_id].empty?
      my_contacts
    else
      @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page(params[:page])
    end

  end

  def autocomplete
    session[:selected_group_id] = params[:group_id]
    @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page
  end

  def inport
    groups = params['group_id']
    users = params['input']
    Contact.inport(params[:file], groups, users)
    flash[:success] = "Contact data inported!"
    redirect_to contacts_path(previous_query_string)
  end

  def new
    @contact = Contact.new
  end
 def show


 end
  def edit
  authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
  end

  def update
    authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
    if @contact.update(contact_params)

      user_reltionships(@contact)

      flash[:success] = "Contact was successfully updated."
      redirect_to contacts_path(previous_query_string)
    else
      flash[:danger] = @contact.errors.full_messages.to_s
      render 'edit'
    end
  end

  def destroy
    authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
    @contact = @contact.destroy
    flash[:success] = "Contact was successfully deleted."
    redirect_to contacts_path
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      @contact.group_ids = params['contact'][:group_id]


            params['contact']['user_id'].each do |u_id|
            next if u_id.to_i == 0
              user = User.find(u_id.to_i)
           user.contacts << @contact

         end


      flash[:success] = "Contact was successfully created."
      redirect_to contacts_path(previous_query_string)
    else
      flash[:danger] = @contact.errors.full_messages.to_s
      render 'new'
    end
 end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :company, :address, :phone, :cell, :county, :state,:country, :postal_code, :notes, :city, :street_num, :strret_name, :group_id, :contact_id, :role, :verified, :avatar,{:user_id => []}, {:group_id => []})
  end

  def find_contact
     @contact = Contact.find(params[:id].to_i)
  end

  def previous_query_string
    if params[:group_id]
       session[:selected_group_id] = params[:group_id]
    end
    session[:selected_group_id] ? {group_id: session[:selected_group_id]} : {}
  end

  def my_contacts
      @users = User.all
      if params[:group_id] && !params[:group_id].empty?
      @contacts = Group.find(params[:group_id]).contacts.order(created_at: :desc).page(params[:page])
      end
  end

end
