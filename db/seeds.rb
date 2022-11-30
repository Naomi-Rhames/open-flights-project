# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

airlines = Airline.create([
    {
        name: "United Airlines",
        image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png"
    },
    {
        name: "South West",
        image_url: "https://open-flights.s3.amazonaws.com/Southwest-Airlines.png"
    },
    {
        name: "Delta",
        image_url: "https://open-flights.s3.amazonaws.com/Delta.png"
    },
    {
        name: "Amaerican Airlines",
        image_url: "https://open-flights.s3.amazonaws.com/American-Airlines.png"
    },
    {
        name: "Alaska Airlines",
        image_url: "https://open-flights.s3.amazonaws.com/Alaska-Airlines.png"
    },
    {
        name: "JetBlue",
        image_url: "https://open-flights.s3.amazonaws.com/JetBlue.png"
    },
])

reviews = Review.create([
    {
        title: 'Best Experience!',
        description: 'The flight attendees were very funny, it made my flight enjoyable',
        score: 5,
        airline: airlines.first
    },
    {
        title: 'Not so good experience....',
        description: 'A bad time, bad flight :( ',
        score: 1,
        airline: airlines.first
    }
])
