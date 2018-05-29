class ContactsController < ApplicationController
  include ContactsHelper
  require 'uri'

  before_action :find_contact, only: [:edit, :update, :destroy, :show]

  after_action :my_contacts, only: [:edit, :update  ]
  protect_from_forgery except: [:index, :show  ]


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
    criteria = params[:term]
    @contacts = Contact.good_search(criteria).page(params[:page])

  end
 def

  def inport
    groups = params['group_id']
    users = params['input']
    Contact.inport(params[:file], groups, users)
    flash[:success] = "Contact data inported!"
    redirect_to contacts_path
  end

  def new

    @contact = Contact.new
    respond_to do |format|
        format.html
        format.js
      end
  end
 def show
  @group_ids = ContactsGroup.select("group_id").where(["contact_id = ?",  @contact.id ])

     respond_to do |format|
        format.html
        format.js
      end
 end
  def edit

  authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
  my_contacts
  @group_ids = ContactsGroup.select("group_id").where(["contact_id = ?",  @contact.id ])

  end

  def update
    authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
    if @contact.update(contact_params)
       user_reltionships(@contact)
       flash[:success] = "Contact was successfully updated."
       if params['update-wiz']
        respond_to do |format|
        format.js { redirect_to contacts_path(previous_query_string), turbolinks: false}
          end
        end



      end

 end






  def destroy
    authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
    @contact = @contact.destroy
    flash[:success] = "Contact was successfully deleted."
    redirect_to contacts_path(previous_query_string)
  end

  def create

    @contact = Contact.new(contact_params)

    if @contact.save
      if params['contact'][:group_id]
      @contact.group_ids = params['contact'][:group_id]
    end
    if  params['contact']['user_id']
        params['contact']['user_id'].each do |u_id|
        next if u_id.to_i == 0 || u_id == "" || u_id.to_i < 1
          user = User.find(u_id.to_i)
       user.contacts << @contact
       end
     end

   else
    flash[:danger] =@contact.errors.to_s
  end
       respond_to do |format|

        format.js { redirect_to contacts_path(previous_query_string), turbolinks: false}
        #or
        #redirect_to post_comments_path(@post), status: 303, turbolinks: false

        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
    end


 end

  private

  def contact_params
    params.require(:contact).permit(:name,  :email, :company, :address, :phone, :cell, :page, :suite, :county, :state, :country, :postal_code, :notes, :city, :street_num, :strret_name, :prefix, :first_name, :middle_name, :last_name, :suffix, :owns_cents, :year_of_Founding, :primary_industry, :web_address, :latitude, :longitude, :type, :facility_size, :total_number_of_employees, :postion, :sic, :zip_code_ext, :group_id, :contact_id, :role, :user_id, :verified, :avatar, {:user_id => []}, {:group_id => []}, :group_id => [], :user_id => [])
  end

  def find_contact
     @contact = Contact.find(params[:id].to_i)
  end

  def previous_query_string
    if params[:group_id]
       session[:selected_group_id] = params[:group_id]

        if params[:page]
         session[:selected_page] = params[:page]
       end
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
            session[:selected_page] = params[:page] if params[:page]


         end

         session[:selected_group_id] = params[:group_id]
    else
      if session[:selected_page] && !session[:selected_group_id].nil?
             @contacts = Group.find( session[:selected_group_id]).contacts.order('last_name ASC').page(params[:selected_page])
      elsif session[:selected_group_id]
             @contacts = Group.find(session[:selected_group_id]).contacts.order('last_name ASC').page(params[:page])
     else
         @contacts = current_user.contacts.order('last_name ASC').page(params[:page])
      end

    end
end


end
