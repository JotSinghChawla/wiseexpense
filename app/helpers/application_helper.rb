module ApplicationHelper
    
    # can define according to Wiseuser timezone later
    DEFAULT_TIMEZONE = "Kolkata"

    def simple_format_datetime(datetime)
        datetime.strftime("%d,%b,%y %l:%M%p")
    end

    def in_user_time_zone(time_with_zone)
        time_with_zone.in_time_zone(DEFAULT_TIMEZONE)
    end
end
