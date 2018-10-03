class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.order(:desc)
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
       User.all.each do |user|
          notification_str =  'Lead '+ @lead.name + ' was added by ' + current_user.first_name
          @notification = Notification.create(name: notification_str, thing: 'lead', thing_id: @lead.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
          user.notifications << @notification if user.id != current_user.id
       end
      flash[:success] = "Lead was successfully created!"
        id_array = [] if !params['contact_ids'].nil? && params['contact_ids'].first.to_i > 0
        if params['contact_ids']
          contact_id_array = params['contact_ids'].to_a

            contact_id_array.each do |id |
              if id.to_i > 0
               id_array << id
              end
           end

          if contact_id_array[0].to_i > 0
           @lead.contact_ids = id_array
         end
       end
         @deal = Deal.create(name: @lead.business)
         @deal.lead_id = @lead.id
        if params['contact_ids']
         @deal.contact_ids = id_array if id_array
        end

        format.html
        format.json { render json: @lead}
        format.js
      else

        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
          User.all.each do |user|
            notification_str =  'Lead '+ @lead.name + ' was updated by ' + current_user.first_name
            @notification = Notification.create(name: notification_str, thing: 'lead', thing_id: @lead.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
            user.notifications << @notification if user.id != current_user.id
          end
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:name, :business, :address, :email, :date, :phone, :number, :size_requirement, :location_need, :time_requirement, :notes, :contact_id, :property_id, :user_id,{:user_ids => []}, :contact_ids)
    end
end
