class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :set_wiseuser

    def authenticate_wiseuser!
        unless @wiseuser.present?
            redirect_to wiseuser_new_path, notice: "Please Login to access this page!"
        end
    end

    private

    def set_wiseuser
        @current_wiseuser ||= Wiseuser.find_by(uuid: cookies[:uuid], remember_token: cookies[:remember_token]) if cookies[:uuid].present? && cookies[:remember_token]
    end

end
