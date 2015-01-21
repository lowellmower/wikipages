class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
		render('contacts/index.html.erb')
	end

	def new
		@contact = Contact.new
		render('contacts/new.html.erb')
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			flash[:notice] = "Your contact was saved to Wikipages!"
			redirect_to("/contacts/#{@contact.id}")
		else
			render('contacts/new.html.erb')
		end
	end

	def show
		@contact = Contact.find(params[:id])
		render('contacts/show.html.erb')
	end

	def edit
		@contact = Contact.find(params[:id])
		render('contacts/edit.html.erb')
	end

	def update
		@contact = Contact.find(params[:id])
			if @contact.update(params[:contact])
				flash[:notice] = "Contact was successfully update!"
				redirect_to("/contacts/#{@contact.id}")
			else
				render('contacts/edit.html.erb')
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		flash[:notice] = "The contact: '#{@contact.name}' was deleted!"
		redirect_to('/contacts')
	end
end
