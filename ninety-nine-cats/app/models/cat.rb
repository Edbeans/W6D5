# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view' 

class Cat < ApplicationRecord
    
include ActionView::Helpers::DateHelper

    CAT_COLORS = ['Orange', 'Red', 'Blue', 'Green', 'Purple', 'Black']
     
    validates :birth_date, :name, presence: true 
    validates :color, presence: true, inclusion: { in: CAT_COLORS }
    validates :name, presence: true 
    validates :sex, presence: true, inclusion: { in: %w(M F) }
    validate :birth_date_cannot_be_future
    
    def birth_date_cannot_be_future
        # if birth_date.present? && birth_date > Date.today
        if birth_date.future?  
            errors.add(:birth_date, "cannot in future")
        end
    end

    def age 
        # time_ago_in_words(Time.now - self.birth_date.to_time) 
        time_ago_in_words(birth_date)
    end

end
