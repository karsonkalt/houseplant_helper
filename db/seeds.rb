devils_ivy = {common_name: "Devil's ivy",
    water_frequency: 9,
    image_path: "devils_ivy.jpg",
    notes: "'Golden Pothos' prefers medium light, well-lit but sunless.  However, it will tolerate low light for long periods.  It does best in medium relative humidity (mist leaves regularly) and moist soil.  Wipe down leaves every so often to remove any collected dust.  No serious pest/disease problems."}
snake_plant = {common_name: "Snake plant",
    water_frequency: 10,
    image_path: "snake_plant.jpg",
    notes: "Snake Plant is a popular house plant and is used as ground cover fillers in interior landscape designs. It is durable, easily grown & difficult to kill and will tolerate very low light areas as filler plants. However, it prefers bright light situations and well-drained soils. Do not overwater as the roots will rot. In spring to autumn allow the soil to dry between waterings. In winter only water ever 1-2 months. It tolerates low humidity and cool temps around 50 degrees."}
philodendron = {common_name: "Philodendron",
    water_frequency: 8,
    image_path: "philodendron.jpg",
    notes: "Set the plant in a location with bright, indirect sunlight. Find a position near a window where the sun’s rays never actually touch the foliage. While it’s normal for older leaves to yellow, if this happens to several leaves at the same time, the plant may be getting too much light. On the other hand, if the stems are long and leggy with several inches between leaves, the plant probably isn’t getting enough light."}
fiddleleaf_fig = {common_name: "Fiddle-leaf fig",
    water_frequency: 10,
    image_path: "fiddleleaf_fig.jpg",
    notes: "Native to the tropical climate of Western Africa, the Fiddle Leaf Fig thrives in very warm, bright, and humid conditions. This can make them somewhat challenging to grow indoors, but they are relatively tough and can withstand less than perfect conditions. They will thrive in an area with bright, filtered light or an eastern facing window. Careful watering and warmer temperatures will help Fiddle Leaf Fig thrive."}
money_tree = {common_name: "Money tree",
    water_frequency: 11,
    image_path: "money_tree.jpg",
    notes: "Money tree plants do best in warmer environments, so you'll want to keep them in an environment that's between 65 and 75 degrees Fahrenheit. But, the good news is, money trees are also pretty flexible and forgiving—they can still handle temperatures that go 10 degrees below or above that ideal range. As far as humidity goes, money trees thrive with extra moisture, so make sure you mist your plant regularly."}
swiss_cheese_plant = {common_name: "Swiss cheese plant",
    water_frequency: 7,
    image_path: "swiss_cheese_plant.jpg",
    notes: "It will take some direct sunlight, but not more than a few hours per day. It's also important not to put it in direct sunlight right away as it's getting acclimated to your home, because the leaves scorch easily."}

species = [devils_ivy, snake_plant, philodendron, fiddleleaf_fig, money_tree, swiss_cheese_plant]
species.each { |species| Species.create(species) }

karson = {username: "karson",
    email: "karson@email.com",
    password_digest: ,
    uid: ,
    provider: }
patrick = {username: "patrick",
    email: "patrick@email.com",
    password_digest: ,
    uid: ,
    provider: }
brad = {username: "brad",
    email: "brad@email.com",
    password_digest: ,
    uid: ,
    provider: }

users = [karson, patrick, brad]
users.each { |user| User.create(user) }

ivysaur = Plant.create(species: devils_ivy, nickname: "Ivysaur", creator_id: karson.id)
snakey = Plant.create(species: snake_plant, nickname: "Snakey", creator_id: karson.id)
fiddle = Plant.create(species: fiddleleaf_fig, creator_id: patrick.id)
cash = Plant.create(species: cash, nickname: "Cash", creator_id: brad.id)