class Bulletin < ApplicationRecord
  belongs_to :author, class_name: 'User', inverse_of: :bulletins
  belongs_to :category
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :photo,
            size: { less_than_or_equal_to: 5.megabyte },
            content_type: %i[jpeg jpg png]
end
