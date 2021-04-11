module PlantsHelper

    def conditionally_add_overdue_watering_class(plant)
        if current_user == @user
            plant.needs_to_be_watered? ? "overdue-watering" : nil
        end
    end

    def conditionally_display_today_if_needs_to_be_watered(plant)
        if plant.watering_overdue?
            "Overdue"
        elsif plant.water_again_in_days == 0
            "Today"
        else
            "in " + plant.water_again_in_days.to_s + " days"
        end
    end

    def conditionally_display_never_if_never_watered(plant)
        if plant.most_recent_watering == nil
            "Never"
        elsif plant.days_since_most_recent_watering == 0
            "Today"
        else
            plant.days_since_most_recent_watering.to_s + " days ago"
        end
    end

end
