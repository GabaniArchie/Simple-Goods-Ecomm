class SessionsController < ApplicationController
    def destroy
      session[:user_id] = nil
      cookies.delete(:simple_goods_user_id)
      flash[:notice] = "Logged out successfully."
      redirect_to login_path
    end
end