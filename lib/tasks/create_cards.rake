namespace :cards do 
    desc "Create cards"
    task :create_cards => :environment do
        cards = MTG::Card.all
        cards.each do |card|
            card.image_url.blank? ? image_url = "/assets/mtgCardBack.jpg" : image_url = card.image_url
            Card.create(name: card.name,multiverse_id: card.multiverse_id, manaCost: card.mana_cost, colors: card.colors, 
                        cmc: card.cmc, cardtype: card.type, rarity: card.rarity, set: card.set, setName: card.set_name, text: card.text, 
                        flavor: card.flavor, artist: card.artist, number: card.number, power: card.power, toughness: card.toughness, 
                        layout: card.layout, image_url: image_url, watermark: card.watermark, original_text: card.original_text, 
                        original_type: card.original_type, rulings: card.rulings)
        end
    end
end
