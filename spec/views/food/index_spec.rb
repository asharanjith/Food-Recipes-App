require 'rails_helper'

RSpec.describe 'Food page view', type: :feature do
  describe 'Food index page' do
    before(:each) do
      @user = User.create!(email: 'max@email.com', password: 'password', password_confirmation: 'password',
                           name: 'Gulalai')
      @food = Food.create!(user_id: @user.id, name: 'Ground beef', measurement_unit: 'kg', price: 12)

      visit 'users/sign_in'
      fill_in 'Email', with: 'max@email.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'Index content of food page' do
      visit '/foods'
      expect(page).to have_content('Food Recipes')
      expect(page).to have_content('Foods By Gulalai')
      expect(page).to have_content('Food Measurement unit Unit price Quantity Actions')
      expect(page).to have_content(@food.name)
      expect(page).to have_content(@food.price)
      expect(page).to have_content(@food.measurement_unit)
      expect(page).to have_content('Delete')
      expect(page).to have_content('Add New Food')
      expect(page).to have_content('©FoodPlanner 2023')

      visit '/foods'
      click_link('Delete')
      expect(page).to have_content('Welcome to the Food Page No Food Exists Please Added Once!')

      click_link('Add New Food')
      expect(page).to have_current_path(new_food_path)
    end
  end
end
