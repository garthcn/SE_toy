require 'spec_helper'

describe Course do
  before { @course = Course.new(name: "os", note: "fucking hard") }

  subject { @course }

  it { should respond_to(:name) }
  it { should respond_to(:note) }
  it { should respond_to(:users) }
end

