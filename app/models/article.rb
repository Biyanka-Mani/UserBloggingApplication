class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title , presence: true,length: {minimum: 2,maximum: 100}
    validates :description ,presence: true,length: {minimum: 20, maximum: 500}
end
