class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validates :first_name, presence: true,  format: { with: /\A[a-zA-Z]{4,}\z/, message: "must be at least 4 letters and contain no symbols" },on: :create
  has_many :articles, dependent: :destroy
  has_many :comments,through: :articles,dependent: :destroy
end
