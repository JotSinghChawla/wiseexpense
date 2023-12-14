class SessionController < ApplicationController

  def create
    @new_wiseuser = Wiseuser.find_by_email(params[:email])
    if @new_wiseuser && @new_wiseuser.authenticate(params[:password])
      cookies[:remember_token] = @new_wiseuser.remember_token
      cookies[:uuid] = @new_wiseuser.uuid
      redirect_to root_path, alert: "Login Successful!"
    else
      flash.now[:alert] = "Invalid Credentials!"
      render "wiseuser/sign_in", status: :unprocessable_entity
    end
  end

  def destroy
    cookies[:remember_token] = nil if cookies[:remember_token].present?
    redirect_to root_path, notice: "Logout Successful!"
  end
  
end
