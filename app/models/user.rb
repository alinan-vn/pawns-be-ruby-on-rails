class User < ApplicationRecord
    has_many :comments
    has_many :replies
    has_many :a_votes
    has_many :articles, through: :comments
    has_many :articles, through: :a_votes

    has_secure_password

    # validates :username, :password, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
    # validates :elo, :profile_pic, :profile_background, :bio, presence: false
    validates :bio, length: { maximum: 200 }
end
