require 'bcrypt'
class Customer < ActiveRecord::Base
	has_many :orders
	attr_accessor :customer_password, :password_confirmation

	before_save :hash_password
	
	# validate :customer_username
	validate :customer_email, presence: true
	validate :customer_email, uniqueness: { case_sensitive: false }
	validate :customer_hashed_password, confirmation: true

	# def authenticate(password)
	# 	self.hashed_password ==
	# 	BCrypt::Engine.hash_secret(password, self.salt)
	# end


	def current_order
		if orders.empty?
			orders.create
		else
			orders.last
		end
	end

	def authenticate(password)
		self.customer_hashed_password ==
		BCrypt::Engine.hash_secret(password, self.customer_salt)
	end


	private
	def hash_password
		if customer_password.present?
			self.customer_salt = BCrypt::Engine.generate_salt
			self.customer_hashed_password = 
			BCrypt::Engine.hash_secret(customer_password, self.customer_salt)
			customer_password = password_confirmation = nil
		end
	end
end









