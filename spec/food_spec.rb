require 'spec_helper'
describe Food do
  describe "#new" do
    it "initializes food item with start coords" do
      food_item = Food.new(25, 25)
      expect(food_item).not_to be_nil
      expect(food_item.x).not_to be_nil
      expect(food_item.y).not_to be_nil
    end
  end
end
