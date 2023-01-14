# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true 
    validates :image_url, presence: true, uniqueness: true 
    validates :artist_id, presence: true, uniqueness: { scope: :title }  
    
    def self.artworks_for_user_id(user_id)
    # returns the artworks owned by user
    # returns artworks shared with user
    # 
        Artwork
            .select('artworks.*') 
            .joins(:shares)
            .where("artist_id = ? OR artwork_shares.viewer_id = ?", user_id, user_id)
            .distinct 

    end 

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :shares,
        source: :viewer
end

