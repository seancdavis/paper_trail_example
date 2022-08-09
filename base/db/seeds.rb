# frozen_string_literal: true

# ---------------------------------------- | User

def create_user
  User.create!(name: Faker::Name.name)
rescue StandardError
  create_user
end

15.times { create_user }

# ---------------------------------------- | Post

def create_post
  Post.create!(body: Faker::Lorem.sentence, user_id: rand(1..15))
rescue StandardError
  create_post
end

100.times { create_post }
