require 'spec_helper'

describe Group do

  before { @group = Group.new(name: "MakerSquare", description: "A bootcamp for full stack developers") }

  subject { @group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

end
