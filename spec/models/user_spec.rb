require 'spec_helper'

describe User do
  before { 
    @user = User.create(name: "andrew", program: "cs") 
    @course = Course.create(name: 'os', note: 'nice')
  }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:program) }
  it { should respond_to(:courses) }
  describe "user course relations" do

    it "should be able to add a course" do
      @user.courses << @course
      @user.courses.size.should == 1
      @user.courses[0].name.should == 'os'
    end

    it "should list users taken one course" do
      @course.users.size.should == 0
      @user2 = User.create(:name => 'mellon', :program => 'cit')
      @user.courses << @course
      @user2.courses << @course
      @course.users.should == 2
    end
  end
end
