require 'rails_helper'

RSpec.describe Account do

  describe 'validations' do
    it { is_expected.to validate_presence_of :payment_date }
    it { is_expected.to validate_presence_of :balance }
  end
  
  describe 'database columns' do
    it { should have_db_column :balance }
    it { should have_db_column :payment_date }
  end

    describe 'associations' do
    it { is_expected.to belong_to :student }
  end
end
