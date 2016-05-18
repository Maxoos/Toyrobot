require 'spec_helper'

describe ToyRobot::Main do
  subject { ToyRobot::Main.new() }

  describe '.command_exists?' do
    it { expect(subject.send(:command_exists?,"INVALID_COMMAND")).to be false }
  end

  describe '.run' do
    context "when invalid command" do
      before { allow(subject).to receive(:gets).and_return('INVALID_COMMAND', 'EXIT') }
      it {expect{subject.run}.to output(/Invalid command/).to_stdout}
    end

    context "when no current location" do
      before { allow(subject).to receive(:gets).and_return('MOVE', 'EXIT') }
      it {expect{subject.run}.to output(/Location not set/).to_stdout }
    end

    context "when invalid place command" do
      before {
        allow(subject).to receive(:gets).and_return('PLACE 3 3 NORTH', 'EXIT')
      }
      it { expect{subject.run}.to output(/Invalid Command/).to_stdout }
    end

    context "when valid PLACE command" do
      before {
        allow(subject).to receive(:gets).and_return('PLACE 3,3,NORTH', 'EXIT')
        subject.run
      }
      it { expect(subject.robot.current_location.to_array).to eq [3,3,"NORTH"] }
    end

    context "when MOVE" do
      before {
        allow(subject).to receive(:gets).and_return('PLACE 3,3,NORTH', 'MOVE', 'EXIT')
        subject.run
      }
      it { expect(subject.robot.current_location.to_array).to eq [3,4,"NORTH"] }
    end

    context "when LEFT" do
      before {
        allow(subject).to receive(:gets).and_return('PLACE 3,3,NORTH', 'LEFT', 'EXIT')
        subject.run
      }
      it { expect(subject.robot.current_location.to_array).to eq [3,3,"WEST"] }
    end

    context "when RIGHT" do
      before {
        allow(subject).to receive(:gets).and_return('PLACE 3,3,NORTH', 'RIGHT', 'EXIT')
        subject.run
      }
      it { expect(subject.robot.current_location.to_array).to eq [3,3,"EAST"] }
    end

    context "when REPORT" do
      before {
        allow(subject).to receive(:gets).and_return('PLACE 1,2,EAST', 'MOVE', 'MOVE', 'LEFT', 'MOVE', 'REPORT', 'EXIT')
      }
      it { expect{subject.run}.to output(/3,3,NORTH/).to_stdout }
    end

  end

  describe "process_place_command" do
    context "when placement is not valid" do
       it { expect{subject.send(:process_place_command,"PLACE 3.0,3,NORTH")}.to raise_error Error::CommandError }
       it { expect{subject.send(:process_place_command,"PLACE NOT,3,NORTH")}.to raise_error Error::CommandError }
       it { expect{subject.send(:process_place_command,"PLACE 3,3,MOON")}.to raise_error Error::CommandError }
    end
    context "when placement is valid" do
      it { expect(subject.send(:process_place_command,"PLACE 3,3,NORTH")).to eq [3,3,"NORTH"] }
    end
  end

end