require 'rails_helper'

feature 'visiting the homepage' do
  scenario 'the visitor sees the company logo' do
    visit root_path
    expect(page).to have_text("Better than AirBnB")
  end
end
