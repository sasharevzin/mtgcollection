json.array!(@cards) do |card|
  json.code card.id
  json.name card.name
end
