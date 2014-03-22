require 'spec_helper'

describe Word do

  before { @word = Word.new(name: "Coder", definition: "Someone who types really well") }

  subject { @word }

  it { should respond_to(:name) }
  it { should respond_to(:definition) }
  it { should be_valid }

  describe "when word is too long" do
    before { @word.name = "a" * 16 }
    it { should_not be_valid }
  end

  describe "when word definition is too long" do
    before { @word.definition = "a" * 141 }
    it { should_not be_valid }
  end

  describe "when word is not present" do
    before { @word.name = ' ' }
    it { should_not be_valid }
  end

  describe "when word definition is not present" do
    before { @word.definition = ' ' }
    it { should_not be_valid }
  end

  describe "when word is incorrectly formatted" do
    before do
      @word.name = "invalid1"
      @word.save
    end
    it { should_not be_valid }
    specify { expect(@word.errors.full_messages).to eq(["Name for word only allows letters"]) }
  end

end
