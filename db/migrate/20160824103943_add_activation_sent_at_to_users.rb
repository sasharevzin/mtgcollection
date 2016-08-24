class AddActivationSentAtToUsers < ActiveRecord::Migration
 def change
   add_column :users, :activation_sent_at, :datetime
 end
end