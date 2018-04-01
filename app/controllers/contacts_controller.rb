class ContactsController < ApplicationController
  include ContactsHelper
  before_action :authenticate_user!
  before_action :find_contact, only: [:edit, :update, :destroy]

  def index
    session[:selected_group_id] = params[:group_id]
    if params[:group_id] && !params[:group_id].empty?
      @contacts = current_user.contacts.merge(Group.where(["group_id = ?", params[:group_id] ])).order(created_at: :desc).page(params[:page])
    else
      @contacts = current_user.contacts.search(params[:term]).order(created_at: :desc).page(params[:page])
    end
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

  if current_user.contacts.where(["id = ?", params[:id] ])
  else

    authorize @contact
  end
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
end
