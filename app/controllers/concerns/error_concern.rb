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
            error_message = "Something went wrong!"
        end
        return error_message
    end
  end