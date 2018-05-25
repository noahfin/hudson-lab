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
  def prepare
    prepared_contacts = Contact.all
    prepared_contacts.each do  |contact|
      if contact.first_name && contact.last_name
        name = contact.first_name + ' ' + contact.last_name
        contact.update_attribute(:name, name)
      end
    end
    redirect_to contacts_path
  end
end
