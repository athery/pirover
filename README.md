Pi Rover
=======

Little Raspberry Pi rover based on picy robot (http://www.piborg.com/picy1), enhanced with a webcam, driven by an embedded webserver.

The bot webcam renders on the screen, and you can drive it by keyboard, mouse, or touch on tablet.

For now the webserver is Sinatra, and uses the pi_piper gem to use the RPi GPIO.

The robot can be instantiated in stubbed mode when not running on a RPi.That means it writes the GPIO actions to the logs instead of really using the GPIO.


##TODO :

- robot.camstream_url gives the url for the streaming of the webcam, using the pi IP
- build the robot ;)
- set the right GPIO pin numbers in server.rb
- implement the move* and the stop_moving methods on robot.rb to set on/off the right GPIO pins
- drive like a crazy and chase the cat in the living room :)
- Add text to speach and a mall amp and 8ohm speaker to have it say things typed on the web interface

##Install
Warning - never done yet, but it should go like this:
- install ruby
- clone thsi project
- run bundle command
- start the website by running: ruby -I. server.rb

