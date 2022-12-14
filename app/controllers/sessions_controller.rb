class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email:params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            flash[:notice] = "successfully logged in"
            session[:user_id] = user.id
            redirect_to articles_path
        else
            flash.now[:alert] = "Couldnt log in"
            render 'new'
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged Out"
        redirect_to root_path
    end
end