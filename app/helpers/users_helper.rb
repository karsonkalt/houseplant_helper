module UsersHelper

    def display_user_data(user)
        "#{pluralize(user.plants.count, "plant")}, #{pluralize(user.waterings.count, "watering")} logged"
    end
end
