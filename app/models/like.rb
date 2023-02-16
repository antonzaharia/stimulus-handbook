class Like < ApplicationRecord
  include CableReady::Broadcaster

  belongs_to :user
  belongs_to :tweet

  validates :user_id, uniqueness: { scope: :tweet_id }

  after_update do
    cable_ready["likes"].morph(
      selector: "#" + ActionView::RecordIdentifier.dom_id(self, :notification),
      html: ""
    )
    cable_ready.broadcast
  end
end
