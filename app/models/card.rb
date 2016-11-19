class Card < ApplicationRecord
    has_and_belongs_to_many :collections
    scope :name_like, -> (name) { where("name ilike ?", name)}
    def card
        @card
    end
    
    def card_name
        card.try(:name)
    end
end
