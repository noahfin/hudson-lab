class SearchController < ApplicationController
def create
     if params[:query].present?
       @contacts = Contact.search(params[:query]).order('name ASC').page(params[:page])

      respond_to do |format|
        format.html
        format.js
      end
       redirect_to contacts_path
    end
  end
end
