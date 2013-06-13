class Player
  attr_reader :x, :y

  attr_accessor :name, :dead, :immortal

  def initialize
    @dead = false
    @immortal = false
    @x = 0
    @y = 0
  end

  def move(direction)
    self.send("move_#{direction}") if self.respond_to? "move_#{direction}"

    chance = rand 1..5
    case chance
    when 1
      try_to_kill
      if @dead
        puts "You fell down a hole and died. Sorry about that."
        exit
      else
        "Thanks to your invincibility, you floated over that hole back there. Lucky escape."
      end
    else
      if @x == 1 and @y == 1
        @immortal = true
        "You picked up the Elixir of Immortality. No more dying!"
      else
        "You are at #{@x}, #{@y}."
      end
    end
  end

  def move_north
    @y += 1
  end

  def move_south
    @y -= 1
  end

  def move_east
    @x += 1
  end

  def move_west
    @x -= 1
  end

  def commit(what)
    if what == "seppuku"
      if try_to_kill
        "You decided to leave this world. Probably a sensible decision."
      else
        "You tried to kill yourself, but you're immortal. How would that even work?"
      end
    end
  end

  def try_to_kill
    @dead = true unless @immortal
  end
end