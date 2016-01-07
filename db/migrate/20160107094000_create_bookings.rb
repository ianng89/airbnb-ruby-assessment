class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.integer :user_id
			t.integer :property_id
			t.datetime :start_date 
			t.datetime :end_date
			t.integer :num_of_days
			t.integer :total_price

		end
	end
end
