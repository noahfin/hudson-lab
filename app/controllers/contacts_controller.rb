class ContactsController < ApplicationController
  include ContactsHelper
  before_action :authenticate_user!
  before_action :find_contact, only: [:edit, :update, :destroy]
  before_action :my_contacts, only: [:edit, :create]

  def index
    session[:selected_group_id] = params[:group_id]
    if params[:group_id] && !params[:group_id].empty?
      my_contacts
    else
      @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page(params[:page])
    end
    render 'index', turbolinks: true, change: 'contacts'
  end

  def autocomplete
    session[:selected_group_id] = params[:group_id]
    @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page(params[:page])
  end

  def new
    @contact = Contact.new
  end

  def edit
  authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
  end

  def update
    authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
    if @contact.update(contact_params)
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
      user_reltionships()
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

  def find_contact
    @contact = Contact.find params[:id]
  end

  def previous_query_string
    session[:selected_group_id] ? {group_id: session[:selected_group_id]} : {}
  end

  def my_contacts
      @users = User.all
      @contacts = current_user.contacts.merge(Group.where(["group_id = ?", params[:group_id] ])).order(created_at: :desc).page(params[:page])
  end

end
