class Spend < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups
  # Validations
  validates_associated :groups
  validates_presence_of :groups
  validates :name, :amount, presence: true
  validates :name, uniqueness: { scope: :author }
  validates :amount, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**3) }
end
