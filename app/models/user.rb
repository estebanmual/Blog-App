class User < ApplicationRecord
  require 'securerandom'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
  validates :Name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :add_token

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def add_token
    update_column(:token, JsonWebToken::EncoderJWT.jwt_encode(email))
  end
end
