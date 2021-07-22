class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness: {scope: :artist_id}

    belongs_to :artist,
        primary_key: :id, 
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy


    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    def self.owned_viewed(user_id)
        # debugger
        Artwork
            .left_outer_joins(:artwork_shares)
            .where("artworks.artist_id = ? OR artwork_shares.viewer_id = ?", user_id, user_id)
    end
end