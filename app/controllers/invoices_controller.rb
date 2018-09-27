class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
        respond_to do |format|
        if @invoice.save
        if !params['contact_ids'].nil? && params['contact_ids'].first.to_i > 0
          id_array = []
          contact_id_array = params['contact_ids'].to_a

            contact_id_array.each do |id|
              if id.to_i > 0
               id_array << id

              end
           end

          if contact_id_array[0].to_i > 0
           @invoice.contact_ids = id_array
         end

       end
         if params['deal_ids']
            params['deal_ids'].each do |d_id|
            next if d_id.to_i == 0 || d_id == "" || d_id.to_i < 1
              deal = Deal.find(d_id.to_i)
              @invoice.deals << deal
           end
         end

        if  params['invoice']['user_ids']
            params['invoice']['user_ids'].each do |u_id|
            next if u_id.to_i == 0 || u_id == "" || u_id.to_i < 1
              user = User.find(u_id.to_i)
               @invoice.users << user
           end
         end




        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:sale_price, :lease_price, :commission, :Commission_Earned, :name, :contact_ids, :deal_ids,{:user_ids => []})
    end
end
