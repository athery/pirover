require 'sinatra'
require 'robot/robot'
require 'socket'

set :bind, '0.0.0.0'

# GPIO pins numbers for left and right motors : first element in the array is forward, second is back
pins  = { right: [4, 5], left: [6, 7] } 

# When running on an actual RPi, you should omit the ":stubbed" param like this : robot = Robot.new(pins)
robot = Robot.new pins, :stubbed

robot_hostname  = Socket.gethostname
video_feed_port = 8081

# Display the pilot's dashboard
get '/' do
  erb :home, locals: {video_feed: "http://#{robot_hostname}:#{video_feed_port}"}
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

get '/speak' do
  robot.speak(params[:text])
  'speach over'
end