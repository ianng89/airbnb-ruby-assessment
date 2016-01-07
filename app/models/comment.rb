class Comment < ActiveRecord::Base

	validates_format_of :rating, :with =>/[1-5]/
	belongs_to :user
	belongs_to :property

end
