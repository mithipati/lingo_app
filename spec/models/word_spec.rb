require 'spec_helper'

describe Word do

  before { @word = Word.new(name: "Coder", definition: "Someone who types really well") }

  subject { @word }

  it { should respond_to(:name) }

end
