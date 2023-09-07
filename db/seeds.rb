require 'faker'
require 'open-uri'

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

puts 'Creating 10 buyers...'
10.times do |i|
  letter = ('a'..'z').to_a[i]
  User.create!(
    email: "#{letter}@duck.com",
    password: '111111',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    is_artist: false
  )
end

puts '>Creating a preference for each buyer...'
User.where(is_artist: false).each do |buyer|
  Preference.create!(
    user: buyer,
    style: Artwork::STYLES.sample
  )
end

puts 'Creating 5 artists...'
5.times do |i|
  letter = ('a'..'z').to_a[i]
  user = User.new(
    email: "#{letter}@regalart.com",
    password: '111111',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    is_artist: true,
    location: Faker::Address.city,
    short_bio: User::SHORT_BIOS[i],
    long_bio: User::LONG_BIOS[i],
  )
  avatar = File.open("app/assets/images/user#{i + 1}_avatar.jpg")
  user.avatar.attach(io: avatar, filename: user.first_name.to_s, content_type: 'image/jpg')
  banner1 = File.open("app/assets/images/user#{i + 1}_1.png")
  user.banners.attach(io: banner1, filename: user.first_name.to_s, content_type: 'image/png')
  banner2 = File.open("app/assets/images/user#{i + 1}_2.png")
  user.banners.attach(io: banner2, filename: user.first_name.to_s, content_type: 'image/png')
  banner3 = File.open("app/assets/images/user#{i + 1}_3.png")
  user.banners.attach(io: banner3, filename: user.first_name.to_s, content_type: 'image/png')
  user.save!
end

puts '>Creating artworks for each artist...'
User.where(is_artist: true).each do |artist|
  rand(2..6).times do
    artwork = Artwork.new(
      user: artist,
      title: Artwork::TITLES.sample,
      description: Artwork::DESCRIPTIONS.sample,
      style: Artwork::STYLES.sample,
      has_details: false,
    )
    file = URI.open('https://source.unsplash.com/900x900/?abstract')
    artwork.photo.attach(io: file, filename: artwork.title, content_type: 'image/png')
    artwork.save!
  end
end

puts '>>Creating art details for one artwork...'
User.where(is_artist: true).each do |artist|
  artwork = Artwork.new(
    user: artist,
    title: Artwork::TITLES.sample,
    description: Artwork::DESCRIPTIONS.sample,
    style: Artwork::STYLES.sample,
    has_details: true
  )
  file = File.open("app/assets/images/user#{[1, 3].sample}_#{rand(1..3)}.png")
  artwork.photo.attach(io: file, filename: artwork.title, content_type: 'image/png')
  artwork.save!
  rand(5..9).times do
    ArtDetail.create!(
      artwork: artwork,
      title: ArtDetail::TITLES.sample,
      description: ArtDetail::DESCRIPTIONS.sample,
      x_value: rand(0..ArtDetail::COORDINATE_COUNT),
      y_value: rand(0..ArtDetail::COORDINATE_COUNT)
    )
  end
end

puts '>Creating Events for each artist...'
User.where(is_artist: true).each do |artist|
  rand(4..9).times do
    month = rand(1..9)
    day = rand(1..30)
    event = Event.new(
      user: artist,
      title: Event::TITLES.sample,
      description: Event::DESCRIPTIONS.sample,
      location: Event::CITIES.sample,
      start_date: DateTime.new(2023, month, day, rand(8..10), [0, 30].sample),
      end_date: DateTime.new(2023, month, day, rand(11..18), [0, 30].sample),
      is_private: [true, false].sample
    )
    file = URI.open('https://source.unsplash.com/900x900/?art-gallery')
    event.photos.attach(io: file, filename: event.title, content_type: 'image/png')
    event.save!
  end
end

puts '>>Creating event attendances...'
60.times do
  EventAttendance.create!(
    user: User.where(is_artist: false).sample,
    event: Event.all.sample,
    message: EventAttendance::MESSAGES.sample,
    attendees: rand(5..20)
  )
end

puts 'Creating subscriptions...'
60.times do
  month = rand(8..12)
  day = rand(1..30)
  Subscription.create!(
    buyer: User.where(is_artist: false).sample,
    artist: User.where(is_artist: true).sample,
    created_at: DateTime.new(2023, month, day, rand(8..10), [0, 30].sample)
  )
end

puts 'Creating conversations...'
Subscription.all.each do |subscription|
  Conversation.create!(

    buyer: subscription.buyer,
    artist: subscription.artist
  )
end

puts '>Creating messages for each conversation...'
Conversation.all.each do |conversation|
  rand(2..7).times do
    Message.create!(
      conversation: conversation,
      user: [conversation.buyer, conversation.artist].sample,
      content: Message::CONTENTS.sample
    )
  end
end

puts 'Finished!'
