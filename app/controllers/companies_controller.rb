class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @companies = Company.all
  end


  def show
    ceo = "CEO"
    president = "President"
    @ceo = @company.contacts.where('postion LIKE ? or postion LIKE ?', "%#{ceo}%", "%#{president}%").first
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
     if @company.save
      if params['contact_ids']
         params['contact_ids'].each do |id|
          next if id == "0"
          @contact = Contact.find(id)
          @company.contacts << @contact
        end
       end
          notification_str =  'Company '+ @company.name + ' was added by ' + current_user.first_name
          @notification = Notification.create(name: notification_str, thing: 'company', thing_id: @company.id.to_s,  user_name: current_user.first_name,  name_id: current_user.id )
          @notification.users = User.all

        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
    end
  end
end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:addres, :earnings, :rent, :sector, :age, :name, :description, :avatar, :deal_ids, :contact_ids, {:contact_ids => []})
    end
end
