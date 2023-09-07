class SubscriberGroup < ApplicationRecord
  belongs_to :user
  has_many :group_attendances, dependent: :destroy
  has_many :messages

  NAMES = ["High-Potential Leads", "Inactive Leads", "Premium Client Opportunities", "Potential Customers", "Trusted Referrals"]
end
