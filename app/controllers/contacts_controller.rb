class ContactsController < InheritedResources::Base

  private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :description)
    end
end

