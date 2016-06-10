require 'spec_helper'
describe Snake do
  describe "#new" do
    let(:snake){Snake.new}
    it "initializes snake position" do
      expect(snake.position).not_to be_nil
      expect(snake.position).to be_kind_of(Array)
      expect(snake.position.size).to be_eql(2)
      expect(snake.position.first).to be_kind_of(Integer)
      expect(snake.position.last).to be_kind_of(Integer)
    end
    it "initializes snake length" do
      expect(snake.size).to be_eql(4)
    end
    it "initializes snake direction" do
      expect(snake.direction).to be_eql(:right)
    end
  end
end
