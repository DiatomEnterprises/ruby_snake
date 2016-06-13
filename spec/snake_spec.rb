require 'spec_helper'
describe Snake do
  describe "#new" do
    let(:snake){Snake.new}
    it "snake is an array of body parts" do
      expect(snake.parts).to be_kind_of(Array)
      expect(snake.parts.size).to be_eql(4)
    end
    it "initializes snake head position" do
      expect(snake.parts.first).not_to be_nil
      expect(snake.parts.first).to be_kind_of(Array)
      expect(snake.parts.first.size).to be_eql(2)
      expect(snake.parts.first.first).to be_kind_of(Integer)
      expect(snake.parts.first.last).to be_kind_of(Integer)
    end
    it "initializes snake length" do
      expect(snake.size).to be_eql(4)
    end
    it "initializes snake direction" do
      expect(snake.direction).to be_eql(:left)
    end
  end
end
