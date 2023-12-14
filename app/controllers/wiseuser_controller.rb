class WiseuserController < ApplicationController
  
  def new
    @new_wiseuser = Wiseuser.new
  end

  def create
    @new_wiseuser = Wiseuser.new(wiseuser_params)
    if @new_wiseuser.save
      cookies[:remember_token] = @new_wiseuser.remember_token
      cookies[:uuid] = @new_wiseuser.uuid
      redirect_to root_path, notice: "Successfully created account!"
    else
      error_arr = []
      [:first_name, :last_name, :email, :password].each do |item|
        error_arr+=@new_wiseuser.errors.full_messages_for(item)
      end
      if error_arr.present?
        error_message = "Errors: " + error_arr.flatten.join(", ")
      else
        error_message = "Something went wrong!"
      end
      flash.now[:alert] = error_message
      render :new, status: :unprocessable_entity
    end
  end

  private

  def wiseuser_params
    params.require(:wiseuser).permit(:first_name, :last_name, :password, :email)
  end

end
