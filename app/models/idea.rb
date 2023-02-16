class Idea < ApplicationRecord
  include CableReady::Broadcaster

  belongs_to :tweet
  acts_as_list scope: :tweet

  after_update do
    cable_ready["ideas"].morph(
      children_only: true,
      selector: "#" + ActionView::RecordIdentifier.dom_id(self),
      html: ApplicationController.render(self),
    )
    cable_ready.broadcast
  end
end
