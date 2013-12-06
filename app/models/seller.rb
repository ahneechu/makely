require 'bcrypt'
class Seller < ActiveRecord::Base
	belongs_to :store
	attr_accessor :password, :password_confirmation

	before_save :hash_password
	validate :seller_username
	validate :email, presence: true
	validate :email, uniqueness: { case_sensitive: false }
	validate :password, confirmation: true

	def authenticate(password)
		self.hashed_password ==
		BCrypt::Engine.hash_secret(password, self.salt)
	end


	private
	def hash_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.hashed_password = 
			BCrypt::Engine.hash_secret(password, self.salt)
			password = password_confirmation = nil
		end
	end
end
