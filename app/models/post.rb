class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  scope :desc, -> {order(created_at: :desc)}
  scope :filter_by_category, ->(category) { where category: category}
end
