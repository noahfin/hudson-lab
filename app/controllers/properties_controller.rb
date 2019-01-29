class PropertiesController < ApplicationController
  before_action :find_property, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!
   def index
    @properties = Property.all.order(created_at: :desc).page(params[:page])
   end
   def new
     @property = Property.new

   end
   def edit

   end
   def search
     @properties = Property.search_property(params[:query])

    respond_to do |format|
      format.html
        format.json { render json: @properties}
        format.js
      end
   end
   def autocomplete
      term = params[:term]
      @properties = Property.search(term)
   end
   def category
       @properties = Property.all
       @categories = Property.pluck(:category).uniq
        @similar_properties = []
         @categories.each do |cat|

     @similar_properties << Property.where("category like ?", "%#{cat}")
     end
   end
     def show
      @similar_properties = Property.where("category like ?", "%#{@property.category}")
     end
     def create
        @property = Property.new(property_params)
        if @property.save
          if Address.exists?([' address LIKE ? ', "%#{@property.Fulladdress}%"])
            @property.address_ids << Address.where([' address LIKE ? ', "%#{@property.Fulladdress}%"])
            else
             @property.address_ids <<  Address.create( address: @property.Fulladdress)
          end
          params['contact_ids'].each_with_index do |c_id, i|
            next if c_id.to_i == 0
           contact = Contact.find(c_id.to_i)
            @property.contacts << contact
           end
          flash[:success] = "The property was successfully created."
          redirect_to properties_path
        else
          flash[:danger] = @property.errors.full_messages.to_s
          render 'new'
        end
     end
   def update
     @property = Property.find(params[:id])
      @property.update_attributes(property_params)
         flash[:info] = "Property Was Updated."
          params['contact_ids'].each_with_index do |c_id, i|
            next if c_id.to_i == 0
           contact = Contact.find(c_id.to_i)
            @property.contacts << contact
           end
         redirect_to property_path(params[:id])
   end
   private
    def property_params
      params.require(:property).permit(:name, :code, :category, :avatar, :Fulladdress, :rental_rate, :price, :year_built, :building_class, :lease_type,  :overhead_doors, :loading_docks, :min_divisible, :space_use, :space_available, :date_available, :property_type, :address, :zip_code, :county, :description, :for_lease,  :for_sale, :owner_name, :type_ofproperty, :known_as, :size_and_floors, :space1,  :space2,  :space3, :space4, :space5, :space6, :rental_per_sf, :cam_per_sf, :cam, :utilites_per_sf, :taxes_per_sf, :rental_includes, :cleaning, :electric, :gross_rental_per_sf, :escalations, :parking, :landlords_work, :possession, :lease_term, :exclusive, :add_comments, :contact_person, :availability, :water_and_sewer, :contact_ids)
    end
    def find_property
      @property = Property.find params[:id]
    end

end



