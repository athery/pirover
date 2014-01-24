Pi Rover
=======

Little Raspberry Pi rover based on picy robot (http://www.piborg.com/picy1), enhanced with a webcam, text to speach, and driven by an embedded webserver.

The bot webcam renders on the screen, and you can drive it with any device connected to the same netork, either by keyboard, mouse, or touch on tablet. Text to speach uses Google translate tts service.

For now the webserver is Sinatra, and uses the pi_piper gem to use the RPi GPIO.

For development, the robot class can be instantiated in stubbed mode when not running on a RPi.That means it writes the GPIO actions to the logs instead of really using the GPIO.

Requirements : motion, mpg321, Ruby, Bundler

##Install
Warning - never done yet on a pi, but it should go like this:
- sudo apt-get install motion
- sudo apt-get install mpg321
- install ruby (tested on MRI 1.9.3 and 2.0 so far)
- clone this project
- run bundle command
- start the motion daemon : sudo service motion start
- start the website by running: ruby -I. server.rb


##TODO :
- better way to calculate the video stream path (maybe using the previous request hostname
- build the robot ;)
- set the right GPIO pin numbers in server.rb
- clean shutdown of the robot from the website
- find a way to start the motion service either on start or from the website
- drive like a crazy and chase the cat in the living room :)
