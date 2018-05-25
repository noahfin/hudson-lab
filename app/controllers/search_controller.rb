class SearchController < ApplicationController
def create
     if params[:query].present?
       @contacts = Contact.search(params[:query]).order('first_name ASC').page(params[:page])

      respond_to do |format|
        format.html
        format.js
      end

    end
  end
end
