Pi Rover
=======

Little Raspberry Pi rover based on picy robot (http://www.piborg.com/picy1), enhanced with a webcam, driven by an embedded webserver.

The bot webcam renders on the screen, and you can drive it by keyboard, mouse, or touch on tablet.

For now the webserver is Sinatra, and all interactions with the pi is faked.

TODO :

- robot.camstream_url gives the url for the streaming of the webcam, using the pi IP
- build the robot ;)
- add the pi_piper gem
- set the GPIO pin numbers in the robot initializer
- implement the move* and the stop_moving methods on robot.rb to set on/off the right GPIO pins
- drive like a crazy and chase the cat in the living room :)
- Add text to speach and a mall amp and 8ohm speaker to have it say things typed on the web interface

Install : never done yet, but should be :
- install ruby
- copy files
- run bundle
- ruby -I. server.rb

