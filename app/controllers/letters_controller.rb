class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def basic_letter
    if params['property_ids']
       @property = Property.find(params['property_ids'].first)
    end
    if params['contact_ids']
       @contact = Contact.find(params['contact_ids'].first)
    end
    render 'basic_letter.html.erb'
  end

  def cover_letter
    if params['property_ids']
       @property = Property.find(params['property_ids'].first)
    end
    if params['contact_ids']
       @contact = Contact.find(params['contact_ids'].first)
    end
    render 'cover_letter.html.erb'
  end

  def proposal_purchase
    if params['property_ids']
       @property = Property.find(params['property_ids'].first)
    end
    if params['contact_ids']
      @contact = Contact.find(params['contact_ids'].first)
    end
    render 'cover_letter.html.erb'
  end

  def proposal_lease
    if params['property_ids']
       @property = Property.find(params['property_ids'].first)
    end
    if params['contact_ids']
      @contact = Contact.find(params['contact_ids'].first)
    end
    render 'proposal_lease.html.erb'
  end

  def exclusive_agreement
    if params['property_ids']
       @property = Property.find(params['property_ids'].first)
    end
    if params['contact_ids']
      @contact = Contact.find(params['contact_ids'].first)
    end
      render 'exclusive_agreement.html.erb'
  end

  def new

  end


  def edit

  end

  def create
    @letter = Letter.new(letter_params)
    respond_to do |format|
      if @letter.save
        format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
        format.json { render :show, status: :created, location: @letter }
      else
        format.html { render :new }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @letter.update(letter_params)
        format.html { redirect_to @letter, notice: 'Letter was successfully updated.' }
        format.json { render :show, status: :ok, location: @letter }
      else
        format.html { render :edit }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @letter.destroy
    respond_to do |format|
      format.html { redirect_to letters_url, notice: 'Letter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_letter
    end

    def letter_params
      params.fetch(:letter, {})
    end
end
