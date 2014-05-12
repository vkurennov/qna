require_relative 'acceptance_helper'

feature 'Create question', %q{
  In order to get answer from community
  As an authenticated user
  I want to be able to ask the question
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user create the question' do
    sign_in(user)

    visit '/questions'
    click_on 'Ask question'
    fill_in 'Title', with: 'Test question'
    fill_in 'Text', with: 'text text text'
    click_on 'Create'

    expect(page).to have_content 'Your question successfully created.'
  end

  scenario 'Non-authenticated user try to create question' do
    visit '/questions'
    click_on 'Ask question'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end