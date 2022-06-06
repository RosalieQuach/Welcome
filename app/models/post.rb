class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  scope :filter_by_category, ->(category) { where category: category}
end
