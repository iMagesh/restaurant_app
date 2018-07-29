restaurant = Restaurant.create(name: "Orange wok", email: "something@gmail.com", phone: "9952034857")
restaurant.restaurant_shifts.create(name: "morning", start_time: "9am", end_time: "12pm")
table = restaurant.restaurant_tables.create(name: "Rom A", min_guests: 2, max_guests: 4)