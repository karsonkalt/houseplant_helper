module PlantsHelper

    def conditionally_add_overdue_watering_class(plant)
        plant.needs_to_be_watered? ? "overdue-watering" : nil
    end

    def conditionally_display_today_if_needs_to_be_watered(plant)
        if plant.water_again_in_days == 0
            "Today"
        else
            "in " + plant.water_again_in_days.to_s + " days"
        end
    end

end
