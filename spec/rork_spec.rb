require 'minitest/spec'
require 'minitest/autorun'

require_relative '../lib/player'

describe "navigation" do

  before do
    @player = Player.new
  end

 it "moves to the North" do
    @player.move "north"
    @player.x.must_equal 0
    @player.y.must_equal 1
  end

  it "moves to the South" do
    @player.move "south"
    @player.x.must_equal 0
    @player.y.must_equal -1
  end

  it "moves to the West" do
    @player.move "west"
    @player.x.must_equal -1
    @player.y.must_equal 0
  end

  it "moves to the East" do
    @player.move "east"
    @player.x.must_equal 1
    @player.y.must_equal 0
  end

  it "moves in all directions" do
    @player.move "north"
    @player.move "south"
    @player.move "east"
    @player.move "west"
    @player.x.must_equal 0
    @player.y.must_equal 0
  end

  it "becomes immortal" do
    @player.move "north"
    @player.move "north"
    @player.move "east"
    @player.move "east"
    @player.immortal.must_equal true
  end

end
