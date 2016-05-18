require 'spec_helper'

describe ToyRobot::Location do
  describe '#valid?' do
    subject { ToyRobot::Location }

    context "when x,y and direction are valid" do
      it { expect(subject.new(1,1,"WEST").valid?).to be true }
    end

    context "when location is invalid" do
      it { expect(subject.new(1,1,"MOON").valid?).to be false }
      it { expect(subject.new(-1,1,"MOON").valid?).to be false }
    end

  end
end