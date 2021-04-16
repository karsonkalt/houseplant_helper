module ApplicationHelper

    def display_errors_if_any(object)
        if object.errors.any?
            @object = object
            render partial: "shared/errors"
        end
    end
    
end
