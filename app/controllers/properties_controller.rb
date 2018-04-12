class PropertiesController < ApplicationController
 def index
  @properties = Property.all
 end
 def new
   @property = Property.new
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
    params.require(:property).permit(:name, :code,:category, :avatar)
  end
end
