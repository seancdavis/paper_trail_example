# frozen_string_literal: true

def create_object(klass, attributes, _attempt = 1)
  obj = klass.new(attributes)
  obj.save!
rescue StandardError => e
  puts "[User ERROR] #{e.message}"
  puts obj.attributes
end

# ---------------------------------------- | User

15.times do
  create_object(User, email: Faker::Internet.email, password: 'password', name: Faker::Name.name)
end

users = User.all

# ---------------------------------------- | Channels

10.times do
  create_object(Channel, title: Faker::Company.buzzword.downcase.gsub(/[\ ']/, '-'))
end

channels = Channel.all

# ---------------------------------------- | Post

500.times do
  create_object(Message, body: Faker::Hipster.sentence, user: users.sample, channel: channels.sample)
end
