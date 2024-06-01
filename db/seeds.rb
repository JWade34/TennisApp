# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a sample user with email, first_name, last_name, and password
user1 = User.create!(
  first_name: 'John',
  last_name: 'Doe',
  email: 'user1@example.com',
  password: 'password',
  password_confirmation: 'password'
)

user2 = User.create!(
  first_name: 'Jane',
  last_name: 'Smith',
  email: 'user2@example.com',
  password: 'password',
  password_confirmation: 'password'
)

# Create some sample matches for user1
Match.create!(
  user: user1,
  opponent_name: "John Doe",
  date: Date.today - 7,
  result: "Won"
)

Match.create!(
  user: user1,
  opponent_name: "Jane Smith",
  date: Date.today - 14,
  result: "Lost"
)

# Create some sample matches for user2
Match.create!(
  user: user2,
  opponent_name: "Alice Johnson",
  date: Date.today - 10,
  result: "Won"
)

Match.create!(
  user: user2,
  opponent_name: "Bob Brown",
  date: Date.today - 20,
  result: "Lost"
)

