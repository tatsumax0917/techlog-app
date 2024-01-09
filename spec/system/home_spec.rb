require 'rails_helper'

RSpec.describe 'Home', type: :system do
  before do 
    driven_by :selenium_chrome_headless
  end
  
  before do
    driven_by(:rack_test)
  end

  describe 'Top page Verification' do
    it 'Home#top should be displayed' do
      visit '/'
      expect(page).to have_content('Home#top')
    end
  end

  # pending "add some scenarios (or delete) #{__FILE__}"
end
