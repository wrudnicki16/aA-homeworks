require 'rspec'
require 'fish'

describe 'Fish' do
  subject(:fish) { ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'] }
  describe "sluggish_fish" do
    it "should find the longest fish" do
      expect(sluggish_fish(fish)).to eq("fiiiissshhhhhh")
    end
  end

  describe "dominant_fish" do

    it "should find the longest fish" do
      expect(dominant_fish(fish)).to eq("fiiiissshhhhhh")
    end

  end

  describe "clever_fish" do

    it "should find the longest fish" do
      example(clever_fish(fish)).to eq("fiiiissshhhhhh")
    end
  end

  describe "dancing_fish" do
    it "should find the longest fish" do
      example(dancing_fish(fish)).to eq("fiiiissshhhhhh")
    end

  end

  it "should find the longest fish"
end
