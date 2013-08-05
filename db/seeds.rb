# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

Variant.create({
  name: 'Parcheesy Board',
  price: 9.99,
  savings_percentage: 50,
  savings_amount: 10,
  thumb_url: 'thumb_placeholder.jpg',
  image_url: 'image_placeholder.jpg',
  sale_type: 'deal'
})

Variant.create({
  name: 'Banana Hammock',
  price: 19.99,
  savings_percentage: 50,
  savings_amount: 20,
  thumb_url: 'thumb_placeholder.jpg',
  image_url: 'image_placeholder.jpg',
  sale_type: 'deal'
})

Variant.create({
  name: 'Jiggy Wand',
  price: 29.99,
  savings_percentage: 50,
  savings_amount: 30,
  thumb_url: 'thumb_placeholder.jpg',
  image_url: 'image_placeholder.jpg',
  sale_type: 'product'
})

Variant.create({
  name: 'Super Under Rater',
  price: 5.99,
  savings_percentage: 50,
  savings_amount: 5,
  thumb_url: 'thumb_placeholder.jpg',
  image_url: 'image_placeholder.jpg',
  sale_type: 'sell_off'
})