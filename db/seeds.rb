require 'faker'

puts 'Cleaning database...'
User.destroy_all
Event.destroy_all
EventAttendance.destroy_all
Artwork.destroy_all
ArtDetail.destroy_all
Preference.destroy_all
Subscription.destroy_all
Conversation.destroy_all
Message.destroy_all

puts 'Creating 4 buyers...'
User.create!(
  email: 'a@a.com',
  password: '111111',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  is_artist: false,
)
User.create!(
  email: 'b@b.com',
  password: '111111',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  is_artist: false,
)
User.create!(
  email: 'c@c.com',
  password: '111111',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  is_artist: false,
)
User.create!(
  email: 'd@d.com',
  password: '111111',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  is_artist: false,
)

puts '  Creating a preference for each buyer...'
User.where(is_artist: false).each do |buyer|
  Preference.create!(
    user: buyer,
    style: Artwork::STYLES.sample
  )
end

puts 'Creating artists...'
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: '111111',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    is_artist: true,
    location: Faker::Address.city,
    short_bio: Faker::Marketing.buzzwords,
    long_bio: Faker::Lorem.paragraph_by_chars(number: 300)
  )
end

puts '  Creating artworks for each artist...'
User.where(is_artist: true).each do |artist|
  rand(2..5).times do
    Artwork.create!(
      user: artist,
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph_by_chars(number: 300),
      style: Artwork::STYLES.sample
    )
  end
end

puts 'Creating art details for each artwork...'
Artwork.all.each do |artwork|
  ArtDetail.create!(
    artwork: artwork,
    title: Faker::Lorem.sentence(word_count: 2),
    description: Faker::Lorem.paragraph_by_chars(number: 100)
  )
end

puts '  Creating Events for each artist...'
User.where(is_artist: true).each do |artist|
  rand(1..3).times do
    Event.create!(
      user: artist,
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph_by_chars(number: 300),
      location: Faker::Address.city,
      start_date: Date.today,
      end_date: Date.today + 1,
      is_private: [true, false].sample
    )
  end
end

puts '    Creating event attendances...'
10.times do
  EventAttendance.create!(
    user: User.where(is_artist: false).sample,
    event: Event.all.sample
  )
end

puts 'Creating subscriptions...'
20.times do
  Subscription.create!(
    buyer: User.where(is_artist: false).sample,
    artist: User.where(is_artist: true).sample
  )
end

puts 'Creating conversations...'
Subscription.all.each do |subscription|
  Conversation.create!(
    buyer: subscription.buyer,
    artist: subscription.artist
  )
end

puts '  Creating messages for each conversation...'
Conversation.all.each do |conversation|
  rand(1..5).times do
    Message.create!(
      conversation: conversation,
      content: Faker::Lorem.paragraph_by_chars(number: 100)
    )
  end
end

puts 'Finished!'
