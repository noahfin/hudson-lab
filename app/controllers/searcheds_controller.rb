class SearchedsController < ApplicationController
  include SearchedsHelper
  before_action :set_searched, only: [:show, :edit, :update, :destroy]

  # GET /searcheds
  # GET /searcheds.json
  def index
    @searcheds = Searched.all
  end

  # GET /searcheds/1
  # GET /searcheds/1.json
  def show
  end

  # GET /searcheds/new
  def new
    @searched = Searched.new
  end

  # GET /searcheds/1/edit
  def edit
  end

  # POST /searcheds
  # POST /searcheds.json
  def create
    @searcheds = Searched.all
    if @searcheds.count >= 7
      searched_shift(@searcheds)
      redirect_to dsahboard_path
    else
    @searched = Searched.new(searched_params)
    contact_id = ''
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
           @searched.contact_ids = id_array
         end
       end

       @searched.update_attributes(:name => @searched.contacts.first.name, :contact_id => contact_id, :number => @searched.contacts.first.phone, :email => @searched.contacts.first.email, :cell =>  @searched.contacts.first.cell, :fulladdress => @searched.contacts.first.Fulladdress)

    respond_to do |format|
      if @searched.save
        format.html { redirect_to @searched, notice: 'Searched was successfully created.' }
        format.json { render :show, status: :created, location: @searched }
      else
        format.html { render :new }
        format.json { render json: @searched.errors, status: :unprocessable_entity }
      end
    end
     end

  end

  # PATCH/PUT /searcheds/1
  # PATCH/PUT /searcheds/1.json
  def update
    respond_to do |format|
      if @searched.update(searched_params)
        format.html { redirect_to @searched, notice: 'Searched was successfully updated.' }
        format.json { render :show, status: :ok, location: @searched }
      else
        format.html { render :edit }
        format.json { render json: @searched.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searcheds/1
  # DELETE /searcheds/1.json
  def destroy
    @searched.destroy
    respond_to do |format|
      format.html { redirect_to searcheds_url, notice: 'Searched was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_searched
      @searched = Searched.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def searched_params
      params.require(:searched).permit(:name, :contact_id, :number, :email, :cell, :fulladdress, :contact_ids,{:user_ids => []})
    end
end
