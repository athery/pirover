require 'robot/motor'
require 'open-uri'

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

  def speak text, lang='fr'
    tts_url = "http://translate.google.com/translate_tts?q=#{URI.escape(text)}&tl=#{lang}"
    file_name = "/tmp/robot_speach_#{Time.now.to_i}.mp3"
    ua = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.68 Safari/534.24"
    
    #download google tts result to tmp mp3 file
    content = open(tts_url, "User-Agent" => ua).read
    File.open(file_name, "wb") do |f|
      f.puts content
    end

    #read the mp3 file using mpg321
    `mpg321 #{file_name}`

  ensure
    #delete tmp mp3 file even if method crashed
    File.delete(file_name) if File.exists?(file_name)
  end

end