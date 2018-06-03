class TouchesController < ApplicationController
  before_action :set_touch, only: [:show, :edit, :update, :destroy]

  # GET /touches
  # GET /touches.json
  def index
    @touches = Touch.all
  end

  # GET /touches/1
  # GET /touches/1.json
  def show

  end
 def contact

 @contact = Contact.find(params[:id])
 @touches = @contact.contact_touches
 render :index
 end
  # GET /touches/new
  def new
    @touch = Touch.new
  end

  # GET /touches/1/edit
  def edit
  end

  # POST /touches
  # POST /touches.json
  def create

    group = Group.find(params['group']['id']) if params['group']['id'] if params['group']['id'] && !params['group']['id'].empty?
    contact_id = []
    group.contacts.each do |contact|
      contact_id << contact.id.to_s
    end

    @touch = Touch.new(touch_params)

    respond_to do |format|
      if @touch.save
        if  params['group']
             contact_array = contact_id
         else

        contact_array = params['contact_ids']
      end
        contact_array.each_with_index do |c_id, i|
          next if c_id.to_i == 0
         contact = Contact.find(c_id.to_i)

          @touch.contacts << contact
         end
        format.html { redirect_to @touch, notice: 'Touch was successfully created.' }
        format.json { render :show, status: :created, location: @touch }
      else
        format.html { render :new }
        format.json { render json: @touch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /touches/1
  # PATCH/PUT /touches/1.json
  def update
    respond_to do |format|
      if @touch.update(touch_params)
        format.html { redirect_to @touch, notice: 'Touch was successfully updated.' }
        format.json { render :show, status: :ok, location: @touch }
      else
        format.html { render :edit }
        format.json { render json: @touch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /touches/1
  # DELETE /touches/1.json
  def destroy
    @touch.destroy
    respond_to do |format|
      format.html { redirect_to touches_url, notice: 'Touch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_touch
      @touch = Touch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def touch_params
      params.require(:touch).permit(:email, :phone, :postcard, :social_media, :in_person, :letter, :description, :contact_id)
    end
end
