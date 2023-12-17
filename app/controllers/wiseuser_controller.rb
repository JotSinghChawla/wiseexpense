class WiseuserController < ApplicationController

  include ErrorConcern

  def sign_in
  end

  def new
    @new_wiseuser = Wiseuser.new
  end

  def create
    @new_wiseuser = Wiseuser.new(wiseuser_params)

    if verify_recaptcha(model: @new_wiseuser) && @new_wiseuser.save
      cookies[:remember_token] = @new_wiseuser.remember_token
      cookies[:uuid] = @new_wiseuser.uuid
      redirect_to root_path, notice: "Successfully created account!"
    else
      wiseuser_column_arr = [:first_name, :last_name, :email, :password]
    
      flash.now[:alert] = get_error_message_for_columns(wiseuser_column_arr, @new_wiseuser)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def wiseuser_params
    params.require(:wiseuser).permit(:first_name, :last_name, :password, :email)
  end

end
