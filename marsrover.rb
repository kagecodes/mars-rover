class Rover

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end

  def x_coordinate
    @x_coordinate
  end

  def y_coordinate
    @y_coordinate
  end

  def direction
    @direction
  end

  def current
    puts "#{x_coordinate} #{y_coordinate} #{direction}"
  end

  def turn(direction)
    if @direction == 'N' && direction == 'L' || @direction == 'S' && direction == 'R'
      @direction = 'W'
    elsif @direction == 'W' && direction == 'L' || @direction == 'E' && direction == 'R'
      @direction = 'S'
    elsif @direction == 'S' && direction == 'L' || @direction == 'N' && direction == 'R'
      @direction = 'E'
    elsif @direction == 'E' && direction == 'L' || @direction == 'W' && direction == 'R'
      @direction = 'N'
    end
  end

  def move
    if @direction == 'N'
      @y_coordinate += 1
    elsif @direction == 'E'
      @x_coordinate += 1
    elsif @direction == 'S'
      @y_coordinate += 1
    elsif @direction == 'W'
      @x_coordinate += 1
    end
  end

  def read_instruction(instruction)
    array = []
    array.push(instruction.split(','))
    array.each do |letter|
      if letter == 'L' || letter == 'R'
        turn(letter)
      else letter == 'M'
        move
      end
    end

  end

end


rover1 = Rover.new(1, 2, 'N')
rover1.read_instruction('LMLMLMLMM')
rover1.current

rover2 = Rover.new(3, 3, 'E')
rover2.read_instruction('MMRMMRMRRM')
rover2.current
