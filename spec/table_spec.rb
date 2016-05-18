require 'spec_helper'

describe ToyRobot::Table do
  describe '#valid_location?' do
    subject { ToyRobot::Table }
    let(:direction) { ToyRobot::Direction.new }

    context "when location is within limits" do
      it { expect(subject.valid_location?(2,3)).to be true }
    end

    context "when location is outside limits" do
      it{ expect(subject.valid_location?(-1,4)).to be false }
      it{ expect(subject.valid_location?(4,-1)).to be false }
      it{ expect(subject.valid_location?(5,4)).to be false }
      it{ expect(subject.valid_location?4,5).to be false }
      it{ expect(subject.valid_location?(-4,5)).to be false }
    end

  end
end