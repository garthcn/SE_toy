require 'spec_helper'

describe User do

  describe "user attribute" do
    before { 
      @user = User.create(name: "andrew", program: "cs") 
      @course = Course.create(name: 'os', note: 'nice')
    }
    subject { @user }

    it { should respond_to(:name) }
    it { should respond_to(:program) }
    it { should respond_to(:courses) }
  end

  describe "user operations" do
  
    it "should be able to create user" do
      @user = User.create(name: "test", program: "cs")
      User.find(:first).program.should == "cs"
    end

    it "should be able to delete user" do
      @user = User.create(name: "test", program: "cs")
      @user.destroy
      User.find(:first).should == nil
    end
  end

  describe "user course relations" do
    before { 
      @user = User.create(name: "andrew", program: "cs") 
      @course = Course.create(name: 'os', note: 'nice')
    }

    it "should be able to add a course" do
      @user.courses << @course
      @user.courses.size.should == 1
      @user.courses[0].name.should == 'os'
    end

  end
end
