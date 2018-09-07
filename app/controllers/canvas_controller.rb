class CanvasController < ApplicationController
  before_action :set_canva, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @canvas = Canva.all
  end

  def show

  end

  def new
    @canva = Canva.new
  end

  def edit

  end

  def create
    @canva = Canva.new(canva_params)
    if params['group_ids']
      @canva.group_ids =   params['group_ids']
      groups = params['group_ids'].to_a
      groups.each do |group|
        group = Group.find(group)
        contacts = group.contacts
        contacts.each do |contact|
        concontact = Cancontact.create(title: contact.name, name: contact.name, email: contact.email, company: contact.company,  Fulladdress: contact.Fulladdress, phone: contact.phone, cell: contact.cell)
        concontact.contact_ids << contact
         @canva.cancontacts << concontact
        end
      end
    end

    respond_to do |format|
      if @canva.save
        format.html { redirect_to @canva, notice: 'Canva was successfully created.' }
        format.json { render :show, status: :created, location: @canva }
      else
        format.html { render :new }
        format.json { render json: @canva.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @canva.update(canva_params)
        if params["contacted"]
           concontacts = params['contacted'].to_a
           concontacts.each do |concontact|
            concontact = Cancontact.find(concontact)
            concontact.update_attributes(contacted: true)
          end
        end
        if params["notes"]
          notes =  params["notes"].to_a
           @canva.cancontacts.each_with_index do |cancontacts, index|
            concontact = Cancontact.find(cancontacts.id)
            concontact.update_attributes(notes: notes[index])
          end
        end
        format.html { redirect_to @canva, notice: 'Canva was successfully updated.' }
        format.json { render :show, status: :ok, location: @canva }
      else
        format.html { render :edit }
        format.json { render json: @canva.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @canva.destroy
    respond_to do |format|
      format.html { redirect_to canvas_url, notice: 'Canva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_canva
      @canva = Canva.find(params[:id])
    end

    def canva_params
      params.require(:canva).permit(:name)
    end
end
