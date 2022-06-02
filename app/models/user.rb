class User < ApplicationRecord
    validates :Name, presence: true

    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
end
