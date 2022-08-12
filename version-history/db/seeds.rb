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

User.create(email: 'admin@example.com', password: 'password', name: 'Admin')
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

PaperTrail.request.disable_model(Message)

Message.all.each do |message|
  message.update!(created_at: rand(1.month).seconds.ago)
end

PaperTrail.request.enable_model(Message)
