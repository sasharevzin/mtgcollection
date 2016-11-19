class AddCardsToCollections < ActiveRecord::Migration[5.0]
  def change
 
    create_table :cards_collections, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :collection, index: true
    end
     
  end
end
 