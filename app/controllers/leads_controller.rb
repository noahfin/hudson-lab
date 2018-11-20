class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @leads = Lead.order(created_at: :desc)
  end

  def show
  end

  def new
    @lead = Lead.new
  end

  def edit
  end

  def create
    @lead = Lead.new(lead_params)

    respond_to do |format|
      if @lead.save
      notification_str =  'Lead '+ @lead.name + ' was added by ' + current_user.first_name
      @notification = Notification.create(name: notification_str, thing: 'lead', thing_id: @lead.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
      @notification.users = User.all
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
       if params['user_ids']
        @lead.users = params['user_ids']
       end
        format.html
        format.json { render json: @lead}
        format.js
      else
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lead.update(lead_params)
         if params['contact_ids']
          id_array = [] if !params['contact_ids'].nil? && params['contact_ids'].first.to_i > 0
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
         if params['user_ids']
            @lead.users = params['user_ids']
         end

        notification_str =  'Lead '+ @lead.name + ' was updated by ' + current_user.first_name
        @notification = Notification.create(name: notification_str, thing: 'lead', thing_id: @lead.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
        @notification.users = User.all

        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_lead
      @lead = Lead.find(params[:id])
    end

    def lead_params
      params.require(:lead).permit(:name, :business, :address, :email, :date, :phone, :number, :size_requirement, :location_need, :time_requirement, :notes, :contact_id, :property_id, :user_ids,{:user_ids => []}, :contact_ids)
    end
end
