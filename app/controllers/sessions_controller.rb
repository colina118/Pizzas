class SessionsController < ApplicationController
	def new

	end

	def create
		user = Employee.find_by_user(params[:employee][:user])
		if user && user.authenticate(params[:employee][:password])
			session[:user_id] = user.id
			redirect_to '/menu'
		else
			flash[:notice] = "El usuario o contraseña esta incorrecto"
			redirect_to '/login'

		end
	end

	def destroy 
		session[:user_id] = nil
		flash[:notice] = "Ha salido de su session"
		redirect_to '/login'
	end

end
