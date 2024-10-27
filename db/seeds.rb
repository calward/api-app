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
User.create!(name: 'First User', email: 'first_userfoo.com')
User.create!(name: 'Second User', email: 'second_user@foo.com')
Post.create!(title: 'Title', body: 'Body', user_id: User.first.id, posted_at: Time.current)