require 'spec_helper'

# Seller sign up - 
# include seller name, password, salt, 
# company(store) name, cause, company(store) description, company(store) image, product info 
# will be submitted to marketplace for review and acceptance

feature "user creates animal", js: true do 
	context "successfully" do
		scenario "creating an animal" do
			visit '/animals/new' #new_animal_path

			fill_in 'Species', with: 'kangaroo'
			fill_in 'Color', with: 'brown'

			click_button 'save'

			expect(page).to have_content 'kangaroo'
			expect(page).to have_content 'brown'
			expect(page).to have_content 'Animal created!'

			expect(Animal.first.color).to eql 'brown'

			# expect(current_path).to eql animals_path

		end
	end
end