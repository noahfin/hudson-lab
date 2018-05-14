class DealsController < ApplicationController
  before_action :find_property, only: [:edit, :update, :destroy, :show]
   def index
    @properties = Deal.all.order(created_at: :desc).page(params[:page])
   end
   def new
     @property = Deal.new

   end
   def edit

   end

 def category
     @deals = Deal.all
     @categories = Deal.pluck(:category).uniq
      @similar_properties = []
       @categories.each do |cat|

   @similar_properties << Deal.where("category like ?", "%#{cat}")
   end
 end
   def show
    @similar_properties = Deal.where("category like ?", "%#{@property.category}")
   end
   def create
      @deal = Deal.new(property_params)
      if @deal.save

        params['contact_ids'].each_with_index do |c_id, i|
          next if c_id.to_i == 0
         contact = Contact.find(c_id.to_i)

          @deal.contacts << contact
         end

        flash[:success] = "The deal was successfully created."
        redirect_to deals_path
      else
        flash[:danger] = @deal.errors.full_messages.to_s
        render 'new'
      end
   end

 def update
@deal = Deal.find(params[:id])

    @deal.update_attributes(property_params)
       flash[:info] = "Deal Was Updated."
        params['contact_ids'].each_with_index do |c_id, i|
          next if c_id.to_i == 0
         contact = Contact.find(c_id.to_i)

          @Deal.contacts << contact
         end
       redirect_to deal_path(params[:id])

  end

   private

    def deal_params
      params.require(:property).permit(:name, :code, :category :contact_ids)
    end
    def find_property
      @deal = Deal.find params[:id]
    end

end

