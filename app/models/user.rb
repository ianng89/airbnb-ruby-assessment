require 'bcrypt'
class User < ActiveRecord::Base

	validates :username, presence: true
	validates :email, presence: true
	validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, message: "EMAIL NOT VALID", multiline: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	has_many :properties
	has_many :comments
	has_many :bookings


include BCrypt

  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def self.authenticate(email, password)
		if user = find_by_email(email)
			if BCrypt::Password.new(user.encrypted_password).is_password? password

				return user
			end
		end
		return nil
	end
end