# Karson's Develoment Notes

# Questions
- Where is the best place to put current_user and logged_in?, as a helper in the ApplicationController or inside ApplicationHelpers?
- The helpers are available to the views, but not the controllers?



# Bugs
- Methods inside application helper are not available in the controller. I tried to move them and can't get it figured out.




# Inconsistencies / Refactoring
- I have the same methods inside the controller and the helper.




# Todo
- Build destroy methods in controllers
- Add update and create methods to all controllers
- Refactor .new and .create inside controllers to user build method appropriately and consistently across controllers.