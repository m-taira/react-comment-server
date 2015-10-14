class Comment < ActiveRecord::Base
  scope :latest, ->(n) { all.limit(10) }
end
