class Subscription < ApplicationRecord
  belongs_to :buyer, class_name: 'User'
  belongs_to :artist, class_name: 'User'
end
