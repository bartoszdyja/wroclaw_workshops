require 'spec_helper'

feature 'User creates student' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    click_on 'Add new one'
  end

  scenario 'with valid input' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
  end

  scenario 'with missing first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with incomplete birthdate' do
    fill_in 'First name', with: 'Mariusz'
    fill_in 'Last name', with: 'Wisniewski'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
    expect(page).to_not have_content "birthdate"
  end

  scenario 'with complete birthdate' do
    fill_in 'First name', with: 'Marek'
    fill_in 'Last name', with: 'Traba'
    fill_in 'Birthdate', with: '01/01/2010'
    click_button 'Create Student'
    expect(page).to have_content "birthdate"
    expect(page).to have_content "2010-01-01"
  end
end
