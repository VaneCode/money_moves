class Group < ApplicationRecord
  # Associations
  belongs_to :user
  has_and_belongs_to_many :spends
  # Validations
  validate :icon, :name, precense: true
  validates :name, uniqueness: { scope: :user }
end
