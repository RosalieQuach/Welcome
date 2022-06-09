class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  scope :filter_by_category, ->(category) { where category: category}


end
