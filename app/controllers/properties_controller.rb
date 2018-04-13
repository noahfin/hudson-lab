class PropertiesController < ApplicationController
  before_action :find_property, only: [:edit, :update, :destroy, :show]
   def index
    @properties = Property.all
   end
   def new
     @property = Property.new
   end
   def show

   end
   def create
      @property = Property.new(property_params)
      if @property.save

        flash[:success] = "The property was successfully created."
        redirect_to properties_path
      else
        flash[:danger] = @property.errors.full_messages.to_s
        render 'new'
      end
   end

   private

    def property_params
      params.require(:property).permit(:name, :code,:category, :avatar, :rental_rate, :price, :year_built, :building_class, :lease_type,  :overhead_doors, :loading_docks, :min_divisible, :space_use, :space_available, :date_available, :property_type, :address, :description, :for_lease,  :for_sale, :owner_name, :contact_id)
    end
    def find_property
      @property = Property.find params[:id]
    end

end

