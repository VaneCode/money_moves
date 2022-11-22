class Group < ApplicationRecord
  # Associations
  belongs_to :user
  has_and_belongs_to_many :spends
  # Validations
  validates :icon, :name, presence: true
  validates :name, uniqueness: { scope: :user }
end
