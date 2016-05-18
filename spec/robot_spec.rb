require 'spec_helper'

describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new }
  it { expect(subject.current_location).to be nil }

  describe ".place" do
    it "should create a current_location" do
      subject.place(1,1,"WEST")
      expect(subject.current_location).to be_kind_of ToyRobot::Location
    end
  end

  describe ".move!" do

    context "when location is not set" do
      it { expect{subject.move!}.to raise_error Error::LocationNotSetError }
    end

    context "when location is not valid" do
        before {
          subject.place(0,0,"SOUTH")
          subject.move!
        }
        it { expect(subject.current_location.to_array).to eq [0,0,"SOUTH"]}
    end

    context "when NORTH" do
      before {
        subject.place(3,3,"NORTH")
        subject.move!
      }
      it { expect(subject.current_location.to_array).to eq [3,4,"NORTH"]}
    end

    context "when SOUTH" do
      before {
        subject.place(3,3,"SOUTH")
        subject.move!
      }
      it { expect(subject.current_location.to_array).to eq [3,2,"SOUTH"]}
    end

    context "when EAST" do
      before {
        subject.place(3,3,"EAST")
        subject.move!
      }
      it { expect(subject.current_location.to_array).to eq [4,3,"EAST"]}
    end
    context "when WEST" do
      before {
        subject.place(3,3,"WEST")
        subject.move!
      }
      it { expect(subject.current_location.to_array).to eq [2,3,"WEST"]}
    end
  end

  describe ".left!" do
    context "when location is not set" do
      it { expect{subject.move!}.to raise_error Error::LocationNotSetError }
    end

    it "should set a new direction" do
      subject.place(3,3,"NORTH")
      subject.left!
      expect(subject.current_location.direction).to eq "WEST"
    end
  end

  describe ".right!" do
    context "when location is not set" do
      it { expect{subject.move!}.to raise_error Error::LocationNotSetError }
    end

    it "should set a new direction" do
      subject.place(3,3,"WEST")
      subject.right!
      expect(subject.current_location.direction).to eq "NORTH"
    end
  end

  describe ".report" do
    context "when location is not set" do
      it { expect{subject.move!}.to raise_error Error::LocationNotSetError }
    end

    it "should set a new direction" do
      subject.place(3,3,"WEST")
      subject.report
      expect(subject.report).to eq "3,3,WEST"
    end
  end

end