class CreateProperties< ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.string :prop_name
			t.string :location
			t.string :prop_type 
			t.integer :occupancy
			t.string :details
			t.integer :user_id
			t.integer :price

		end
	end
end
