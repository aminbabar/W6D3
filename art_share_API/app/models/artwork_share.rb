class ArtworkShare < ApplicationRecord
    validates :artwork_id, :viewer_id, presence: true
    validates :viewer_id, uniqueness: {scope: :artwork_id}

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork
    
    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User
end
