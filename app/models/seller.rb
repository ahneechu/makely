require 'bcrypt'
class Seller < ActiveRecord::Base
	belongs_to :store
	attr_accessor :password, :password_confirmation

	before_save :hash_password

	# validates :seller_username, presence: true
	# validates :seller_username, uniqueness: { case_sensitive: false }
	validates :email, presence: true
	validates :email, uniqueness: { case_sensitive: false }
	# check to see if password and password_confirmation is validating correctly
	validates :hashed_password, confirmation: true
	# validates :password_confirmation, confirmation: true

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
