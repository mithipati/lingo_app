require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do

    it "should have the content 'Join a Group'" do
      visit '/static_pages/home'
      expect(page).to have_content('Join a Group')
    end
  end
end
