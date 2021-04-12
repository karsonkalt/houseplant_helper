# Karson's Develoment Notes

# Questions
- Where is the best place to put current_user and logged_in?, as a helper in the ApplicationController or inside ApplicationHelpers?
- The helpers are available to the views, but not the controllers?
- Is it okay for me to have methods on the model where it returns data "for the view" or should those be exclusively in the helpers?
- Can I use query params as the scope, or should it have its own route?



# Bugs
- Methods inside application helper are not available in the controller. I tried to move them and can't get it figured out.




# Inconsistencies / Refactoring
- I have the same methods inside the controller and the helper.




# Todo
- Refactor .new and .create inside controllers to user build method appropriately and consistently across controllers.
- Add scope methods to only show overdue/sort alphabetically/top-users