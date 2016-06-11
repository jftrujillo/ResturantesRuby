require 'rails_helper'

feature 'Session' do
  before do
    create :customer
  end

  scenario 'logs into new session' do
    visit '/customers/sign_in'
    within '#new_customer' do
      fill_in 'customer[email]', with: Customer.first.email
      fill_in 'customer[password]', with: '123456789'
    end
    click_button 'Sign In'
    expect(page).to have_content 'Foo Application'
  end
end
