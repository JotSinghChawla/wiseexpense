module ApplicationHelper

    def simple_format_datetime(datetime)
        datetime.strftime("%d,%b,%y %l:%M%p")
    end
end
