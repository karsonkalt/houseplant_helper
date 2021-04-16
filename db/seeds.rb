Species.create({common_name: "Devil's ivy",
    water_frequency: 9,
    image_path: "devils_ivy.jpg",
    notes: "'Golden Pothos' prefers medium light, well-lit but sunless.  However, it will tolerate low light for long periods.  It does best in medium relative humidity (mist leaves regularly) and moist soil.  Wipe down leaves every so often to remove any collected dust.  No serious pest/disease problems."})
Species.create({common_name: "Snake plant",
    water_frequency: 10,
    image_path: "snake_plant.jpg",
    notes: "Snake Plant is a popular house plant and is used as ground cover fillers in interior landscape designs. It is durable, easily grown & difficult to kill and will tolerate very low light areas as filler plants. However, it prefers bright light situations and well-drained soils. Do not overwater as the roots will rot. In spring to autumn allow the soil to dry between waterings. In winter only water ever 1-2 months. It tolerates low humidity and cool temps around 50 degrees."})
Species.create({common_name: "Philodendron",
    water_frequency: 8,
    image_path: "philodendron.jpg",
    notes: "Set the plant in a location with bright, indirect sunlight. Find a position near a window where the sun’s rays never actually touch the foliage. While it’s normal for older leaves to yellow, if this happens to several leaves at the same time, the plant may be getting too much light. On the other hand, if the stems are long and leggy with several inches between leaves, the plant probably isn’t getting enough light."})
Species.create({common_name: "Fiddle-leaf fig",
    water_frequency: 10,
    image_path: "fiddleleaf_fig.jpg",
    notes: "Native to the tropical climate of Western Africa, the Fiddle Leaf Fig thrives in very warm, bright, and humid conditions. This can make them somewhat challenging to grow indoors, but they are relatively tough and can withstand less than perfect conditions. They will thrive in an area with bright, filtered light or an eastern facing window. Careful watering and warmer temperatures will help Fiddle Leaf Fig thrive."})
Species.create({common_name: "Money tree",
    water_frequency: 11,
    image_path: "money_tree.jpg",
    notes: "Money tree plants do best in warmer environments, so you'll want to keep them in an environment that's between 65 and 75 degrees Fahrenheit. But, the good news is, money trees are also pretty flexible and forgiving—they can still handle temperatures that go 10 degrees below or above that ideal range. As far as humidity goes, money trees thrive with extra moisture, so make sure you mist your plant regularly."})
Species.create({common_name: "Swiss cheese plant",
    water_frequency: 7,
    image_path: "swiss_cheese_plant.jpg",
    notes: "It will take some direct sunlight, but not more than a few hours per day. It's also important not to put it in direct sunlight right away as it's getting acclimated to your home, because the leaves scorch easily."})
Species.create({common_name: "ZZ plant",
    water_frequency: 12,
    image_path: "zz_plant.jpg",
    notes: "Situate your ZZ in low to bright indirect light, and water when fully dry. Typically you can even forget a watering…or three…and it will still thrive. ZZ is also very resistant to diseases and insects. If your plant’s branches intrude into your space and get in the way, simply prune them away."})
Species.create({common_name: "Chinese money plant",
    water_frequency: 7,
    image_path: "chinese_money.jpg",
    notes: "Light-wise, the best situation for a Chinese money plant is bright light, with no direct sunlight. Direct sun scorches leaves, and light shade may encourage larger leaves. They’re said to be hardy down to freezing, and a period of cool temperatures may make them more likely to produce their tiny white flowers on pink stems."})
Species.create({common_name: "Air plant",
    water_frequency: 7,
    image_path: "air_plant.jpg",
    notes: "Air plants prefer bright indirect light. Meaning, don't plan to keep them right in a windowsill unless it receives filtered light, or possibly only gentle morning sun. Air plants are prone to getting a bit “fried” in direct sunlight, especially when it is amplified through a glass window or terrarium."})
Species.create({common_name: "Jade plant",
    water_frequency: 14,
    image_path: "jade_plant.jpg",
    notes: "Jade plants need at least 4 hours of direct sunlight each day. Young plants should be kept in bright, indirect sunlight; large, well-established jade plants can handle more direct sunlight."})
Species.create({common_name: "Lucky bamboo",
    water_frequency: 6,
    image_path: "lucky_bamboo.jpg",
    notes: "In it's native environment Dracaena sanderiana receive an ample amount of light. However, the surrounding plants shade the lucky bamboo from direct exposure to the sun. Too much direct sunlight can cause the leaves to burn."})
Species.create({common_name: "Spider plant",
    water_frequency: 9,
    image_path: "spider_plant.jpg",
    notes: "Spider plants like even moisture; they don't like to be too dry or too wet. Keep plants in bright to moderate indirect sunlight. Spider plants do not appreciate direct, hot sunlight, which can burn their leaves, causing brown tips and spots. Spider plants grow fairly quickly and can easily become pot bound."})

NOTE = [
    "He looked a little brown on the ends today. I turned him around and moved him to the living room.",
    "It's too humid in the living room so I moved him back to the bedroom.",
    "Happy and healthy as always!",
    "Snipped the tips of his leaves to help him grow big and strong!"
]

def random_user_generator
    rand(30..100).times do
        username = Faker::Internet.username(specifier: 4..15)
        email = Faker::Internet.email
        password = "password"
        User.create(username: username, email: email, password: password)
    end
end

random_user_generator

def random_plant_generator
    rand(200..350).times do
        if rand(1..4) == 1
            nickname = nil
        else
            nickname = Faker::Creature::Cat.name
        end
        species_id = rand(1..(Species.count))
        if rand(1..4) == 1
            water_frequency = rand(7..30)
        else
            water_frequency = nil
        end
        user_id = rand(1..(User.count))
        Plant.create(nickname: nickname, species_id: species_id, water_frequency: water_frequency, user_id: user_id)
    end
end

random_plant_generator

def random_watering_generator(plant)
    rand(1..20).times do
        random_datetime = DateTime.now - rand(1..99).days - rand(1..23).hours - rand(1..59).minutes - rand(1..59).seconds
        random_number = rand(1..10)
        if random_number == 1
            notes = NOTE[0]
        elsif random_number == 2
            notes = NOTE[1]
        elsif random_number == 3
            notes = NOTE[2]
        elsif random_number == 4
            notes = NOTE[3]
        else
            note = nil
        end
        Watering.create(plant: plant, datetime: random_datetime, notes: notes)
    end
end

Plant.all.each {|plant| random_watering_generator(plant)}