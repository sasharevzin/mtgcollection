json.array!(@cards) do |card|
  json.code card.id
  json.name "#{card.name} | #{card.cardtype} | #{card.setName}"
  json.image card.image_url
  json.text card.text
end
