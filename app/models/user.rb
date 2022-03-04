# frozen_string_literal: true

class User < ApplicationRecord
  has_many :bulletins, inverse_of: :user, dependent: :destroy

  ransack_alias :name, :first_name_or_last_name

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def guest?
    false
  end
end
