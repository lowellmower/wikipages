class PhonesController < ApplicationController
	def new
		contact = Contact.find(params[:contact_id])
		@phone = contact.phones.new
	end

	def create
		@phone = Phone.new(:number => params[:number],
											:contact_id => params[:contact_id])
		if @phone.save
			render 'success'
		else
			render 'new'
		end
	end

	def destroy
		@phone = Phone.find(params[:id])
		@phone.destroy
	end

	def edit
		@phone = Phone.find(params[:id])
	end

	def update
		@phone = Phone.find(params[:id])
		@phone.update(params[:phone])
		render('phones/success.html.erb')
	end

end