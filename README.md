# Restaurant APP API

* Ruby 2.2.2

## Data

Few seed data has been added for restaurants, restaurant_tables, restaurant_shifts, guests

## Doc

**Create restaurants**

POST https://magesh-restaurant.herokuapp.com/api/v1/restaurants

*Parameters:*
`name` 
`email`
`phone`

**Create guests**

POST https://magesh-restaurant.herokuapp.com/api/v1/guests

*Parameters:*

`name`
`email`

**List reservations**

GET https://magesh-restaurant.herokuapp.com/api/v1/reservations/

*Parameters:*
`id`

**Create reservation**

POST https://magesh-restaurant.herokuapp.com/api/v1/reservations

*Parameters:*
`restaurant_table_id`
`restaurant_shift_id`
`guests_count`
`reservation_from`
`reservation_to`
`guest_email`
`guest_name`

**Update reservation (pass the id along with url)**

PATCH https://magesh-restaurant.herokuapp.com/api/v1/restaurants/1


## Rspec Tests

Use command:
```rspec spec```

