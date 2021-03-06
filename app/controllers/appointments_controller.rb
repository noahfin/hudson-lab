class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

 def index
    @appointments = Appointment.all
    if @appointments.length.zero?
      flash[:alert] = 'You have no appointments. Create one now to get started.'
    end
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end


  def edit
  end

  attr_reader :message


  def create
    Time.zone = appointment_params[:time_zone]
    @appointment = Appointment.new(appointment_params)
      message = "The appontment '#{@appointment.name}' added, I will remind you two hours before the appointment."
      TwilioTextMessenger.new(message).call(params['appointment']['phone_number'])
        if !params['contact_ids'].nil? && params['contact_ids'].first.to_i > 0
          id_array = []
          contact_id_array = params['contact_ids'].to_a
            contact_id_array.each do |id |
              if id.to_i > 0
               id_array << id
               contact_id = id.to_s
              end
           end
          if contact_id_array[0].to_i > 0
           @appointment.contact_ids = id_array
         end
       end
        if  params['appointment']['user_id']
            params['appointment']['user_id'].each do |u_id|
            next if u_id.to_i == 0 || u_id == "" || u_id.to_i < 1
              user = User.find(u_id.to_i)
            @appointment.users << user
           end
         end

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:name, :phone_number, :time, :fulladdress, :contact_ids,{:user_ids => []})
    end
end
