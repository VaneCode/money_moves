class Group < ApplicationRecord
  # Associations
  belongs_to :user
  has_and_belongs_to_many :spends
  # Validations
  validates :name, presence: true, uniqueness: { scope: :user }
  validates :icon, presence: true
  # Method
  def calc_total
    spends.sum(:amount)
  end
end
