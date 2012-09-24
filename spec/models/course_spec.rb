require 'spec_helper'

describe Course do
  describe "course attribute" do
    before { @course = Course.new(name: "os", note: "fucking hard") }

    subject { @course }

    it { should respond_to(:name) }
    it { should respond_to(:note) }
    it { should respond_to(:users) }
  end

  describe "course operations" do
    it "should create course" do
      @course = Course.new(name: "se", note: "good")
      @course.save
      
      @course = Course.find_by_id(1)
      @course.name.should == "se"
      @course.note.should == "good"
    end

    it "should edit course" do
      @course = Course.new(name: "se", note: "good")
      @course.update_attributes(name: "os", note: "bad")
      Course.find(:first).note.should == "bad"
    end

    it "should delete course" do
      @course = Course.new(name: "se", note: "good")
      @course.save

      @course.destroy
      Course.find_by_id(1).should == nil
    end
  end
end

