class DashboardController < ApplicationController
  def index
    @deals = Deal.all
     @tasks = Task.all
  end

  def contacts_search
      @contacts = Contact.search(params[:query]).order('name ASC')
      render json: @contacts
  end
end
