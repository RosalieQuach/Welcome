class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_location,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }
end
