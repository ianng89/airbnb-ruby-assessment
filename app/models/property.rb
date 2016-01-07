class Property < ActiveRecord::Base

	has_many :comments
	has_many :bookings
	belongs_to :user
	belongs_to :booking

end
