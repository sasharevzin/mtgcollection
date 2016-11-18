class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :multiverse_id
      t.string :manaCost
      t.string :colors, array: true
      t.string :colorIdentity, array: true
      t.integer :cmc
      t.string :cardtype
      t.string :cardtypes, array: true
      t.string :cardsubtypes, array: true
      t.string :rarity
      t.string :set
      t.string :setName
      t.text :text
      t.string :flavor
      t.string :artist
      t.string :number
      t.string :power
      t.string :toughness
      t.string :layout
      t.text :image_url, :default => "www.google.com"
      t.string :watermark
      t.string :rulings, array: true #-- Belongs To Card
      #t.string :foreign, array: true-- Belongs To Card
      t.string :printings, array: true
      t.text :original_text
      t.string :original_type
      #t.string :legalities, array:true -- Belongs To Card
      t.timestamps
    end
  end
end
