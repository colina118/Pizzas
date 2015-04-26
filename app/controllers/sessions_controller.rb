class SessionsController < ApplicationController
	def new

	end

	def create
		user = Employee.find_by_user(params[:employee][:user])
		if user && user.authenticate(params[:employee][:password])
			session[:user_id] = user.id
			redirect_to pizzas_path
		else
			redirect_to '/login'
		end
	end

	def destroy 
		session[:user_id] = nil
		redirect_to '/login'
	end

end
