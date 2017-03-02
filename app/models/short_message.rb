class ShortMessage < ApplicationRecord

  belongs_to :person

  scope :in_last_month, -> { where("short_messages.created_at > ?", 1.month.ago) }

end
