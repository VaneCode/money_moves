class Spend < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups
  # Validations
  validate :name, :amount, precense: true
  validate :name, uniqueness: { scope: :user }
  validates :amount, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**3) },
                     format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
end
