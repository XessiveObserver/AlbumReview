class Album < ApplicationRecord
    validates :name, presence: true
    validates :artist, presence: true
    validates :review, presence: true, length: {minimum: 10}
    validates :genre, presence: true
    has_one_attached :album_cover_art
    belongs_to :user
    has_many :comments
end
