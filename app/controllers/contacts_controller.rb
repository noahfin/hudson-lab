class ContactsController < ApplicationController
  include ContactsHelper
  before_action :find_contact, only: [:edit, :update, :destroy, :show]
  before_action :my_contacts, only: [:edit  ]
  protect_from_forgery except: :index

  def index
    @contact = Contact.new
    session[:selected_group_id] = params[:group_id]
    if params[:query].present?
       @contacts = Contact.search(params[:query]).order('name ASC').page(params[:page])
    else
      my_contacts
    end
    respond_to do |format|
        format.html
        format.js
      end
  end

  def autocomplete
    session[:selected_group_id] = params[:group_id]
    query = params[:query]
    @contacts = Contact.where('name LIKE ? OR first_name LIKE ? OR last_name LIKE ? OR company LIKE ? OR email LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")

  end
    def sort
    session[:selected_group_id] = params[:group_id]
    query = params[:query]
    @contacts = Group.find(params[:group_id]).contacts.where('county LIKE ? OR postal_code LIKE ? OR type LIKE ? OR city LIKE ?', "%#{ params['county']}%", "%#{ params['postal_code']}%", "%#{ params['type']}%", "%#{ params['city']}%").order('last_name ASC').page(params[:page])


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
  @group_ids = ContactsGroup.select("group_id").where(["contact_id = ?",  @contact.id ])
 end
  def edit
  authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
  @group_ids = ContactsGroup.select("group_id").where(["contact_id = ?",  @contact.id ])
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


            params['user_id'].each do |u_id|
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
    params.require(:contact).permit(:name,  :email, :company, :address, :phone, :cell, :county, :state,:country, :postal_code, :notes, :city, :street_num, :strret_name, :prefix, :first_name, :middle_name, :last_name, :suffix, :owns_cents, :year_of_Founding, :primary_industry, :web_address, :latitude, :longitude, :type, :facility_size, :total_number_of_employees, :postion, :sic, :group_id, :contact_id, :role, :verified, :avatar, {:user_id => []}, {:group_id => []}, :group_id => [], :user_id => [])
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

        if params['county']
          county = params['county']
          group = Group.find(params[:group_id])
            @contacts = group.contacts.by_county(county).order('last_name ASC').page(params[:page])
            session[:selected_group_id] = params[:group_id]
        else
         @contacts = Group.find(params[:group_id]).contacts.order('last_name ASC').page(params[:page])
       end
        session[:selected_group_id] = params[:group_id]
    else
        @contacts = current_user.contacts.order('last_name ASC').page(params[:page])
      end
  end


end
