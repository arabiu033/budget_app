require 'rails_helper'

RSpec.describe 'Services', type: :system do
  describe 'show page' do
    subject { FactoryGirl.create(:category, user: FactoryGirl.create(:user, :confirmed)) }
    before do
      5.times do
        t1 = FactoryGirl.create(:service, user: subject.user)
        FactoryGirl.create(:service_category, service: t1, category: subject)
      end
    end

    it 'shows the right content' do
      visit '/users/sign_in'
      sleep(2)
      fill_in 'Email', with: subject.user.email
      sleep(2)
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path('/')
      sleep(2)
      expect(page).to have_content(subject.name)
      click_link(subject.name)
      sleep(2)
      expect(page).to have_current_path(category_path(subject))
      sleep(2)
      expect(page).to have_content(Service.find(1).name)
      expect(page).to have_content(Service.find(2).name)
      expect(page).to have_content(Service.find(3).name)
      expect(page).to have_content('Add new transaction')
      click_link('Add new transaction')
      sleep(2)
      expect(page).to have_current_path(new_category_service_path(subject))
    end
  end
end
