require 'spec_helper'
describe Game do
  describe "#new" do
    it "initializes game" do
      expect(Game.new.gameboard).to be_kind_of(Board)
    end
  end
end
