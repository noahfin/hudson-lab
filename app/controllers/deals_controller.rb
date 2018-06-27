class DealsController < ApplicationController
  include DealsHelper
  before_action :find_property, only: [:edit, :update, :destroy, :show]
   def index
    @deals = Deal.all.order(created_at: :desc)
      respond_to do |format|
       format.html
       format.json { render json: @tasks }
       render 'index', turbolinks: true, change: 'content'
     end
   end
   def new
     @deal = Deal.new

   end
   def edit

   end
  def autocomplete
       @deals = Deal.search(params[:term]).order('name ASC')
  end

 def category
     @deals = Deal.all
     @categories = Deal.pluck(:category).uniq
      @similar_deals = []
       @categories.each do |cat|

   @similar_deals << Deal.where("category like ?", "%#{cat}")
   end
 end
   def show
    @mainpost = Mainpost.new
     @comment = Comment.new
   end
   def create

      @deal = Deal.new(deal_params)
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
    @deal.update_attributes(deal_params)
       if  params['contact_ids']
            deal_reltionships( @deal)
       end
       flash[:info] = "Deal Was Updated."
       redirect_to deal_path(params[:id])
  end
 def destroy
    respond_to do |format|
      if @deal.destroy
        flash[:danger] = "The deal was successfully deleted."
        format.html { redirect_to deals_url }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to deals_url }
        format.json { render json: @deal.errors, status: :forbidden }
        format.js { render status: :forbidden }
      end
    end
  end

   private

    def deal_params
      params.require(:deal).permit(:name, :code, :category, :active, :image,  :lead_id, :user_ids,  :status, :potential_commission, :contact_ids, :company_ids  => [])
    end
    def find_property
      @deal = Deal.find params[:id]
    end

end

