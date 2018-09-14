class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @deals = Deal.all
    @tasks = Task.all
    @projects = Project.all
    @leads = Lead.all
    @searcheds = Searched.all
  end

  def contacts_search
    term = params[:query]
      @contacts = Contact.where('name LIKE ? or first_name LIKE ? or last_name LIKE ? or company LIKE ? or email LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%").order(:name) if term.present?
      render json: @contacts
  end
end





