require 'spec_helper'

describe ToyRobot::Direction do
  subject { ToyRobot::Direction }

  describe '#valid_direction?' do
    context "when direction valid" do
      it { expect(subject.valid_direction?("EAST")).to be true }
    end

    context "when direction invalid" do
      it { expect(subject.valid_direction?("MARS")).to be false }
    end
  end

  describe '#left_of' do
     context "when direction invalid" do
       it { expect{subject.left_of "NONE"}.to raise_error Error::DirectionError }
     end

    context "when direction is within array limits" do
      it { expect(subject.left_of "EAST").to eq "NORTH" }
    end

     context "when direction is outside array limits" do
       it "should loop around" do
         expect(subject.left_of "NORTH").to eq "WEST"
       end
     end
  end

  describe '#right_of' do
    context "when direction invalid" do
      it { expect{subject.right_of "NONE"}.to raise_error Error::DirectionError }
    end

    context "when direction is within array limits" do
      it { expect(subject.right_of "EAST").to eq "SOUTH" }
    end

    context "when direction is outside array limits" do
      it "should loop around" do
        expect(subject.right_of "WEST").to eq "NORTH"
      end
    end
  end

end