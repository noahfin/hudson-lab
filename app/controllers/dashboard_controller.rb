class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @deals = Deal.all
    @tasks = Task.all
    @projects = Project.all
    @leads = Lead.all
  end

  def contacts_search
      @contacts = Contact.search(params[:query]).order('name ASC')
      render json: @contacts
  end
end
