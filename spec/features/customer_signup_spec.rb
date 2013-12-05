require 'spec_helper'

# Seller sign up - 
# include seller name, password, salt
# Seller creates a store - 
# company(store) name, cause, company(store) description, company(store) image, product info 
# will be submitted to marketplace for review and acceptance

feature "customer sign up", js: true do 
	context "successfully" do
		scenario "creating a customer" do
			visit '/customers/new' 

			
			fill_in 'customer_username', with: 'joelee'
			fill_in 'customer_email', with: 'joelee@example.com'
			fill_in 'customer_hashed_password', with: '5678'
			fill_in 'password_confirmation', with: '5678'

			click_button 'save'

			expect(page).to have_content 'joelee'
			expect(page).to have_content 'joelee@example.com'
			expect(page).to_not have_content '5678'
			expect(page).to_not have_content '5678'
			expect(page).to have_content 'Customer created!'

			expect(Customer.first.customer_username).to eql 'joelee'

			expect(current_path).to eql customers

		end
	end
end

