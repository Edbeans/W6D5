# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  username      :string           not null
#  email         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  favorite_coin :string           not null
#  age           :integer          not null
#
class User < ApplicationRecord  
    validates :username, :email, presence: true, uniqueness: true # when a username is created it must have a username, else it will fail 

    has_many :chirps,
        primary_key: :id,
        foreign_key: :author_id, 
        class_name: :Chirp,
        dependent: :destroy 

    has_many :likes, 
        primary_keys: :id,
        foreign_keys: :liker_id,
        class_name: :Like,
        dependent: :destroy

    has_many :liked_chirps,
        through: :likes,
        source: :chirp,
        dependent: :destory 
end


