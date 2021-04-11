module PlantsHelper

    def conditionally_add_overdue_watering_class(plant)
        if current_user == @user
            plant.needs_to_be_watered? ? "overdue-watering" : nil
        end
    end

    def conditionally_display_today_if_needs_to_be_watered(plant)
        if plant.water_again_in_days == 0
            "Today"
        else
            "in " + plant.water_again_in_days.to_s + " days"
        end
    end

end
