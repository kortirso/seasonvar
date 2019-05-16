# Represents episodes of seasons
class Episode < ApplicationRecord
  belongs_to :season, touch: true
end
