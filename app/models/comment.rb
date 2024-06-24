class Comment < ApplicationRecord
    belongs_to :user,optional: true
    belongs_to :article
    validates :message,presence: true,length: {minimum:2,maximum:100}
    scope :custom_display,->{order(:created_at).last(20)}
end
