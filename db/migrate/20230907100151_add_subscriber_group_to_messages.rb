class AddSubscriberGroupToMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :messages, :subscriber_group, foreign_key: true
  end
end
