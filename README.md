# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

This project was largely complete from the onset and was intended to simulate the experience of being introduced to a new codebase in a largely unfamiliar language, as if we were starting a new job as a junior developer. Prior to the introduction of this project we had been working with Ruby for only a few days and had no experience with Rails.

The first portion of the assignment involved the introduction of several features and fixes:

* standardizing currency format across the app
* replacing content of cart page with a message when the cart is empty
* adding "SOLD OUT!" badge to products with 0 stock
* adding an order details table to be shown after checkout
* adding basic authentication (username, password) in order to access admin pages
* adding product and category counts on the admin homepage
* adding a new "about" page, accessible from the top nav
* adding a form allowing admins to create new categories
* adding forms allowing users to create accounts and log in using sessions

After implementing these basic features, we were also tasked with writing RSpec tests to confirm that they worked. This also involved adding additional validation requirements to the user model. On top of the basic RSpec tests used to confirm that validation and authentication worked correctly, we also wrote more detailed tests using capybara to simulate user input and confirm that pages were linking to eachother and rendering their elements correctly.

Unsurprisingly, there was a bit of a steep learning curve to this project. However, as the days went on and I became more familliar with the codebase and Ruby on Rails things started to fall into place. Though it was only a very small taste, I feel slightly more prepared for the many challenges I will face once I begin my career as a developer.

![Product with a "SOLD OUT!" badge](https://github.com/gerard-c/jungle-rails/blob/master/docs/sold-out-badge.png?raw=true)

![Order details page](https://github.com/gerard-c/jungle-rails/blob/master/docs/order-details.png?raw=true)

![Empty cart message](https://github.com/gerard-c/jungle-rails/blob/master/docs/empty-cart.png?raw=true)

![Account creation page](https://github.com/gerard-c/jungle-rails/blob/master/docs/create-account.png?raw=true)




## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
2. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
