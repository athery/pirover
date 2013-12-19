require 'sinatra'
require 'robot'

set :bind, '0.0.0.0'

# GPIO pins numbers for left and right motors : first element in the array is forward, second is back
pins  = { right: [4, 5], left: [6, 7] } 

# When running on an actual RPi, you should omit the ":stubbed" param like this : robot = Robot.new(pins)
robot = Robot.new pins, :stubbed

# Display the pilot's dashboard
get '/' do
  erb :home
end

# called by XHR when the user presses one of the arrows of teh joystick to set the robot in motion
get '/move/:direction' do
  if %w(forward back right left).include?(direction = params[:direction])
    robot.send("move_#{direction}")
    direction
  end
end

# called by XHR when the user relases all joystick arrows : the robot then stops
get '/stop' do
  robot.stop_moving
  'stopped'
end
