# frozen_string_literal: true

# ---------------------------------------- | User

def create_user
  User.create!(email: Faker::Internet.email, password: 'password', name: Faker::Name.name)
rescue StandardError => e
  puts e.message
  create_user
end

15.times { create_user }
users = User.all

# ---------------------------------------- | Channels

def create_channel
  Channel.create!(title: Faker::Music.band.downcase.gsub(' ', '-'))
rescue StandardError => e
  puts e.message
  create_channel
end

10.times { create_channel }
channels = Channel.all

# ---------------------------------------- | Post

def create_message(channel, user)
  puts user.id
  Message.create!(body: Faker::Lorem.sentence, user:, channel:)
rescue StandardError => e
  puts e.message
  create_message(channel, user)
end

channels.each do |channel|
  rand(20..100).times { create_message(channel, users.sample) }
end
