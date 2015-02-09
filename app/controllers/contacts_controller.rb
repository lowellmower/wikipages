class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			flash[:notice] = "Your contact was saved to Wikipages!"
			redirect_to contacts_path
			#redirect_to("/contacts/#{@contact.id}")
		else
			render 'new'
		end
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
			if @contact.update(params[:contact])
				flash[:notice] = "Contact was successfully update!"
				redirect_to contacts_path(@contact)
				#redirect_to("/contacts/#{@contact.id}")
			else
				render 'edit'
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		flash[:notice] = "The contact: '#{@contact.name}' was deleted!"
		redirect_to contacts_path
	end
end
