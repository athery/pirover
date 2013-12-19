require 'motor'

class Robot
  attr_accessor :right_motor, :left_motor

  def initialize pins, stubbed=false
    if stubbed
      @right_motor = StubbedMotor.new(pins[:right])
      @left_motor  = StubbedMotor.new(pins[:left])
    else
      @right_motor = PiMotor.new(pins[:right])
      @left_motor  = PiMotor.new(pins[:left])
    end
  end

  def move_forward
    right_motor.forward
    left_motor.forward
  end

  def move_back
    right_motor.back
    left_motor.back
  end

  def move_right
    right_motor.stop
    left_motor.forward
  end

  def move_left
    right_motor.forward
    left_motor.stop
  end

  def stop_moving
    right_motor.stop
    left_motor.stop
  end

end