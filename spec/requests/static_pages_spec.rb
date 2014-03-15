require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should have_content('Join a Group') }
    it { should_not have_title('| Home') }
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
    it { should have_content('twitter') }
  end

  it "should have the right links in the layout" do
    visit root_path
    expect(page).to have_title('Lingo')
    click_link "Contact"
    expect(page).to have_title('Contact')
    expect(page).to have_content('twitter')
    click_link 'LINGO'
    expect(page).to have_content('Join a Group')
    click_link 'Browse groups'
    expect(page).to have_title('Groups')
  end

end
