# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

APIKey.create!(value: 1234)

20.times do
  User.create!(name: Faker::Name.name, email: Faker::Internet.email)
end

100.times do
  Post.create!(title: Faker::Lorem.word, body: Faker::Lorem.paragraph, user: User.find(User.ids.sample), posted_at: Time.current)
end

100.times do
  Post.first.comments.create!(message: Faker::Lorem.paragraph, user: User.find(User.ids.sample), commented_at: Time.current)
  Comment.create!(message: Faker::Lorem.paragraph, post: Post.find(Post.ids.sample), user: User.find(User.ids.sample), commented_at: Time.current)
end
