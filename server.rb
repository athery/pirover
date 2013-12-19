require 'sinatra'
require 'robot'

set :bind, '0.0.0.0'

#GPIO pins numbers for left and right motors : first elt in the array is forward, second is back
pins  = { right: [4, 5], left: [6, 7] } 

robot = Robot.new pins, :stubbed

get '/' do
  erb :home
end

get '/move/:direction' do
  if %w(forward back right left).include?(direction = params[:direction])
    robot.send("move_#{direction}")
    direction
  end
end

get '/stop' do
  robot.stop_moving
  'stopped'
end
