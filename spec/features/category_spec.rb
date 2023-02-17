require 'rails_helper'

RSpec.describe 'Category', type: :system do
  describe 'index page' do
    subject { FactoryGirl.create(:user, :confirmed) }
    before do
      5.times do
        FactoryGirl.create(:category, user: subject)
      end
    end

    it 'shows the right content' do
      visit '/users/sign_in'
      sleep(2)
      fill_in 'user-email', with: subject.email
      sleep(2)
      fill_in 'user-pass', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path('/')
      sleep(2)
      expect(page).to have_content('')
      expect(page).to have_content(Category.find(1).name)
      expect(page).to have_content(Category.find(2).name)
      expect(page).to have_content(Category.find(3).name)
      expect(page).to have_content(Category.find(4).name)
      expect(page).to have_content(Category.find(5).name)
    end
  end
end
