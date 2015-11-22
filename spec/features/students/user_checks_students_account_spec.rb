require 'spec_helper'

feature 'User checks student account' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit report_accounts_path
  end

  scenario 'without logging in' do
    logout
    expect(page).to have_content 'Sign in'
    visit report_accounts_path
    expect(page).to_not have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'and checks the payment date' do
    expect(page).to have_content Date.today+30.days
  end

  scenario 'and checks the balance' do
    within('table') do
      expect(page).to have_content 0
    end
  end

  scenario 'should see students list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Accounts'
    end

    expect(page).to have_content 'Jan'
  end



end