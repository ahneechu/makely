require 'spec_helper'

# Seller sign up - 
# include seller name, password, salt
# Seller creates a store - 
# company(store) name, cause, company(store) description, company(store) image, product info 
# will be submitted to marketplace for review and acceptance

feature "seller sign up", js: true do 
	context "successfully" do
		scenario "creating a seller" do
			visit '/sellers/new' #new_sellers_path

			
			fill_in 'seller_username', with: 'suelee'
			fill_in 'email', with: 'suelee@example.com'
			fill_in 'password', with: '1234'
			fill_in 'password_confirmation', with: '1234'

			click_button 'save'

			expect(page).to have_content 'suelee'
			expect(page).to have_content 'suelee@example.com'
			expect(page).to_not have_content '1234'
			expect(page).to_not have_content '1234'
			expect(page).to have_content 'Seller created!'

			expect(Seller.first.seller_username).to eql 'suelee'

			expect(current_path).to eql new_stores_path

		end
	end
end