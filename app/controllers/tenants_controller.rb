class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]
  def index
    @tenants = Tenant.all
  end

  def show
  end

  def new
    @tenant = Tenant.new
  end

  def edit
  end

  def create
    @tenant = Tenant.new(tenant_params)

    respond_to do |format|
      if @tenant.save
        contacts =  params['contact_ids'].to_a
        if contacts
        contacts = contacts
        contact_array = []
        contacts.each do |contact_id|
        next if contact_id == ""
           if contact_id.to_i > 0
            contact_array.push(contact_id)
               @tenant.contact_ids = contact_array
            end
         end
       end
        format.html { redirect_to @tenant, notice: 'Tenant was successfully created.' }
        format.json { render :show, status: :created, location: @tenant }
      else
        format.html { render :new }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tenant.update(tenant_params)
        format.html { redirect_to @tenant, notice: 'Tenant was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant }
      else
        format.html { render :edit }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tenant.destroy
    respond_to do |format|
      format.html { redirect_to tenants_url, notice: 'Tenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    def tenant_params
      params.require(:tenant).permit(:company_name, :notes, :lease_up, :space_size, :price, :fulladress, :use, :contact_ids)
    end
end
