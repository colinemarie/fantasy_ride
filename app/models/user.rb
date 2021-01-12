class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  has_many :vehicles, dependent: :destroy
  has_many :reservations_as_owner, through: :vehicles, source: :reservations
  validates :first_name, :last_name, :age, presence: true
end
