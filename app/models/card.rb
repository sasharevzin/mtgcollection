class Card < ApplicationRecord
    has_and_belongs_to_many :collections
    
    def card
        @card
    end
end
