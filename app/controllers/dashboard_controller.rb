class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @deals = Deal.order(created_at: :desc)
    @tasks = Task.order(created_at: :desc)
    @projects = Project.order(created_at: :desc)
    @leads = Lead.order(created_at: :desc)
    @searcheds = Searched.all
    @appointments = Appointment.order(created_at: :desc)
  end

  def contacts_search
    term = params[:query]
      @contacts = Contact.where('name LIKE ? or first_name LIKE ? or last_name LIKE ? or company LIKE ? or email LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%").order(:name) if term.present?
      render json: @contacts
  end
end





