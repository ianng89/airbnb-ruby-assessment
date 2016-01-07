class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.integer :user_id
			t.string :comment_text
			t.integer :rating
			t.integer :property_id
		end
	end
end
