class ContactsController < ApplicationController
  include ContactsHelper
  require 'uri'
  before_action :authenticate_user!
  before_action :find_contact, only: [:edit, :update, :destroy, :show]
  after_action :my_contacts, only: [:edit, :update  ]
  protect_from_forgery except: [:index, :show  ]

  def index
    session[:return_to] = request.referer
    @contact = Contact.new
    session[:selected_group_id] = params[:group_id]
    if params[:query].present?
       @contacts = Contact.search(params[:query]).order(:name).page(params[:page])
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
    @searcheds = Searched.all
    searcheds_array = []
    custom_index = 1
    @searcheds.each_with_index do|searched, index|
     searcheds_array[custom_index] = {name: searched.name, contact_id: searched.contact_id, email: searched.email, cell: searched.cell, number: searched.number, fulladdress: searched.fulladdress}
     custom_index += 1
    end
    if !@contacts.nil? && @searcheds.count < 7
       Searched.create(:name => @contacts.first.name, :contact_id => @contacts.first.id, :number => @contacts.first.phone, :email => @contacts.first.email, :cell =>  @contacts.first.cell, :fulladdress => @contacts.first.Fulladdress)
    else
        @searcheds.first.update_attributes(:name => @contacts.first.name, :contact_id =>  @contacts.first.id, :number => @contacts.first.phone, :email => @contacts.first.email, :cell =>  @contacts.first.cell, :fulladdress => @contacts.first.Fulladdress) if !@contacts.nil?
        @searcheds.each_with_index do|searched, index|
           next if index == 0
           temp_array = []
        if  searcheds_array[index]
            searcheds_array[index].each do |val|
            temp_array << val
           end
            searched.update_attributes(:name => temp_array[0][1], :contact_id =>   temp_array[1][1], :number =>  temp_array[2][1], :email =>   temp_array[3][1], :cell =>    temp_array[4][1], :fulladdress =>  temp_array[5][1])
        end
      end
    end
 end

  def letter
    @contact = Contact.find(params[:contact_id])
    render 'letter.html.erb'
  end

  def inport
    groups = params['groups']
    users = params['input']
    Contact.inport(params[:file], groups, users)
    flash[:success] = "Contact data inported!"
    redirect_to contacts_path
  end

  def new
    session[:return_to] = request.referer
    @lead = Lead.new
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
    if current_user
    authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
      if @contact.update(contact_params)
        notification_str =  'Contact '+ @contact.name + ' was updated by ' + current_user.first_name
        @notification = Notification.create(name: notification_str, thing: 'contact', thing_id: @contact.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
        @notification.users = User.all
        user_reltionships(@contact)
        flash[:success] = "Contact was successfully updated." unless @contact.errors.any?
        @contacts = @contact
    respond_to do |format|
      format.html
        format.json { render json: @properties}
        format.js
      end
      end
    end
  end

  def destroy
    authorize @contact unless current_user.contacts.where(["id = ?", params[:id] ])
    searched = Searched.where([' contact_id LIKE ?', "%#{@contact.id.to_s}%"])
      if searched
         searched.each do |search_object|
         search_object.destroy
        end
      end
    respond_to do |format|
      if @contact.destroy
        flash[:danger] = "The Action Step was successfully deleted."
        format.html { redirect_to contacts_url }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to contacts_url }
        format.json { render json: @contact.errors, status: :forbidden }
        format.js { render status: :forbidden }
      end
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
        notification_str =  'Contact '+ @contact.name + ' was added by ' + current_user.first_name
        @notification = Notification.create(name: notification_str, thing: 'contact', thing_id: @contact.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
        @notification.users = User.all

       address = Address.where([' city LIKE ? and street_num LIKE ? and strret_name  LIKE ?', "%#{params['contact']['city'] }%", "%#{params['contact']['street_num']}%", "%#{params['contact']['strret_name']}%"]).first
      if  address != nil
        @contact.address_ids << address
        else
          if params['contact']['Fulladdress']
            address = Address.create(address: params['contact']['Fulladdress'])
            @contact.address_ids <<  address
          end
      end
      if params['contact'][:group_id]
      @contact.group_ids = params['contact'][:group_id]
     end
     if params['group_ids']
      @contact.group_ids = params['group_ids']
     end
    if  params['contact']['user_id']
        params['contact']['user_id'].each do |u_id|
        next if u_id.to_i == 0 || u_id == "" || u_id.to_i < 1
          user = User.find(u_id.to_i)
       user.contacts << @contact
       end
     end
     if  params['user_ids']
        params['user_ids'].each do |u_id|
        next if u_id.to_i == 0 || u_id == "" || u_id.to_i < 1
          user = User.find(u_id.to_i)
       user.contacts << @contact
       end
     end
      @lead =  Lead.where("business LIKE ? ", "%#{@contact.company}%").limit(30) if @contact.company && !@contact.company.empty?
          @contact.leads << @lead if !@lead.nil?
          redirect_to action: "index"
          flash[:success] = "Contact was successfully added"
    else
      flash[:danger] = @contact.errors.to_s
      render 'new'
   end
  end

  private
    def contact_params
      params.require(:contact).permit(:name,  :email, :company, :address, :Fulladdress, :address_id, :address_ids, :size_requirement, :location_need, :lease_is_up, :time_requirement, :phone, :cell, :page, :page_url, :suite, :county, :state, :country, :postal_code,:zip_code_ext, :city, :street_num, :strret_name, :notes,  :prefix, :first_name, :middle_name, :last_name, :suffix, :owns_cents, :year_of_Founding, :primary_industry, :web_address, :latitude, :longitude, :type, :facility_size, :total_number_of_employees, :postion, :sic, :zip_code_ext, :group_id, :contact_id, :role, :user_id, :lead_ids, :verified, :avatar, :image, {:user_id => []}, {:group_id => []}, :group_id => [], :user_id => [], :company_ids  => [])
    end

    def find_contact
       @contact = Contact.find(params[:id].to_i)
    end
    def previous_query_string
      if params[:group_id] && !params[:group_id].empty?
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
              @contacts = group.contacts.by_county(county).order(:last_name).page(params[:page])
          else
            if params['term']
              term = params['term'].split.map(&:capitalize)*' '
              group = Group.find(params[:group_id])
              @contacts = group.contacts.in_group(term).order(:last_name).page(params[:page])
            else
              @contacts = Group.find(params[:group_id]).contacts.order(:last_name).page(params[:page])
            end
         end
      else
      if session[:selected_page] && !session[:selected_group_id].nil?
          @contacts = Group.find( session[:selected_group_id]).contacts.order(:last_name).page(params[:selected_page])
        elsif session[:selected_group_id]
          @contacts = Group.find(session[:selected_group_id]).contacts.order(:last_name).page(params[:page])
       else
           @contacts = current_user.contacts.order('last_name ASC').page(params[:page]) unless !current_user
       end
         previous_query_string()
      end
    end
  end
