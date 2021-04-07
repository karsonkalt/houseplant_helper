# Karson's Develoment Notes

# Questions
1. I have a question on nested routes when they use a form partial. The form_with method accepts a model instance, but with nested routes sometimes it will need to also be passed the route. Is there already a solve for this in rails? Or do I need to build out a helper method to generate the route method if its needed?



# Bugs
- When a edit fails the URL displays back as the index route, not the edit route.
- When signup fails it the URL displays back as the index route, not the signup route.
- If you don't select a plant species when making a plant it crashes because Species isn't able to be identified in water_frequency method.




# Inconsistencies
1. I changed the users form partial to only accept a model, the rest accept both a model and the route.




# Todo
- Build destroy methods in controllers
- Add update and create methods to all controllers
- Refactor .new and .create inside controllers to user build method appropriately and consistently across controllers.