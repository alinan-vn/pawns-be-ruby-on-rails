class Article < ApplicationRecord
    has_many :comments
    has_many :a_votes
    has_many :users, through: :comments
    has_many :users, through: :a_votes
end
