class ContactsController < ApplicationController
	def new
		@contact=Contact.new
	end

	def create
		@contact=Contact.new(params[:contact])
		@contact.request=request
		if @contact.deliver
			
		else
			flash[:alert]='There was a error please review the email and message'
			render :new
		end
	end
end
