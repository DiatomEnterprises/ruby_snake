require 'spec_helper'
describe Food do
  let(:food_item){ Food.new(25, 25) }
  describe "#new" do
    it "initializes food item with start coords" do
      expect(food_item).not_to be_nil
      expect(food_item.x).not_to be_nil
      expect(food_item.y).not_to be_nil
    end
  end

  it "#coordinates returns array of food's coords" do
    expect(food_item.coordinates).to eq([food_item.x, food_item.y])
  end
end
