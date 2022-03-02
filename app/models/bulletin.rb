# frozen_string_literal: true

class Bulletin < ApplicationRecord
  include AASM
  
  belongs_to :author, class_name: 'User', inverse_of: :bulletins
  belongs_to :category
  has_one_attached :photo

  validates :name, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :photo,
            size: { less_than_or_equal_to: 5.megabyte },
            content_type: %i[jpeg jpg png]
  validates :category, presence: true
  
  aasm whiny_transitions: false do
    state :draft, initial: true
    state :under_moderation, :published, :rejected, :archived

    event :to_moderate do
      transitions from: :draft, to: :under_moderation
    end

    event :publish do
      transitions from: :under_moderation, to: :published
    end

    event :reject do
      transitions from: :under_moderation, to: :rejected
    end

    event :archive do
      transitions from: %w[draft under_moderation published], to: :archived
    end
  end
end
