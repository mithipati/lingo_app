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

  describe "all links work" do
    before { visit root_path }

    click_link "Contact"
    it { should have_title('Contact') }
    click_link "LINGO"
    it { should have_content('Join a Group') }
  end

end
