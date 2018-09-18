class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
 def index
    @appointments = Appointment.all
    if @appointments.length.zero?
      flash[:alert] = 'You have no appointments. Create one now to get started.'
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    Time.zone = appointment_params[:time_zone]
    @appointment = Appointment.new(appointment_params)
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
           user.appointments << @contact
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

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
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

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:name, :phone_number, :time, :fulladdress, :contact_ids,{:user_ids => []})
    end
end
