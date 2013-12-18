require 'sinatra'
require 'robot'

set :bind, '0.0.0.0'

robot = Robot.new

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
