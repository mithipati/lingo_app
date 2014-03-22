require 'spec_helper'

describe Group do

  before { @group = Group.new(name: "MakerSquare", description: "A bootcamp for full stack developers") }

  subject { @group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should be_valid }

  describe "when name is not present" do
    before { @group.name = '' }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @group.name = 'a' * 26 }
    it { should_not be_valid }
  end

  describe "when group name is already taken" do
    before do
      group_with_same_name = @group.dup
      group_with_same_name.name = @group.name.upcase
      group_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @group.description = "a" * 141 }

    it { should_not be_valid }
  end
end
