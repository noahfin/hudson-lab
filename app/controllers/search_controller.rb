class SearchController < ApplicationController
def index
   if params[:query].present?
     @contacts = Contact.search(params[:query])

   else
     @Contacts = Contact.all
   end
 end
end
