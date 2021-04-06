module ApplicationHelper

    def display_errors_if_any(object)
        if object.errors.any?
            render partial: "shared/errors"
        end
    end

end
