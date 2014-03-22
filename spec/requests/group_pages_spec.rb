require 'spec_helper'

describe "GroupPages" do
  subject { page }
  let(:name) { "MakerSquare" }
  let(:description) { "Bootcamp for full stack developers" }

  describe "new group page" do
    before { visit new_group_path }

    it { should have_content('New group') }
  end

  describe "new group" do
    before { visit new_group_path }

    describe "with invalid information" do
      it "should not create a group" do
        expect { click_button 'Create' }.not_to change(Group, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: name
        fill_in "Description", with: description
      end

      it "should create a group" do
        expect { click_button 'Create' }.to change(Group, :count).by(1)
      end

      describe "after saving the group" do
        before { click_button 'Create' }

        it { should have_title(name) }
        it { should have_content(name) }
        it { should have_content(description) }
        it { should have_selector('div.alert.alert-success') }
      end
    end
  end

  describe "should have an 'Add word' button" do
    let(:group) { FactoryGirl.create(:group) }
    before { visit group_path(group) }

    it { should have_content(group.name) }
    # xit { should have_content('Def') }
    # xit { should have_content('Example') }
    it { should have_title(full_title(group.name)) }
    # it { should have_link 'Add word' }
  end
end
























