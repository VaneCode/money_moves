class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Associations
  has_many :spends, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, dependent: :destroy
  # Validations
  validates :name, presence: true
  # Methods
  def calc_total_spends
    spends.sum(:amount)
  end
end
