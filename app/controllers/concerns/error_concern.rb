module ErrorConcern
    extend ActiveSupport::Concern
  
    def get_error_message_for_columns(column_arr, error_object)
        error_arr = []
        column_arr.each do |item|
            error_arr+=error_object.errors.full_messages_for(item)
        end
        if error_arr.present?
            error_message = "Errors: " + error_arr.flatten.join(", ")
        else
            if error_object.errors.first && error_object.errors.first.type == "reCAPTCHA verification failed, please try again."
                error_message = error_object.errors.first.full_message
            else
                error_message = "Something went wrong!"
            end
        end
        return error_message
    end
end