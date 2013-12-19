class PiMotor
  attr_accessor :forward_pin, :back_pin
  def  initialize pins
  	@forward_pin = PiPiper::Pin.new(pin: pins[0], direction: :out) 
  	@back_pin    = PiPiper::Pin.new(pin: pins[1], direction: :out)
  end

  def forward
  	@forward_pin.on
  	@back_pin.off
  end

  def back
  	@forward_pin.off
  	@back_pin.on
  end

  def stop
  	@forward_pin.off
  	@back_pin.off
  end
end


# stubbed version, simply writing to the console for debug purposes on a non RPi PC

class StubbedMotor
  attr_accessor :forward_pin, :back_pin
  def  initialize pins
  	@forward_pin = "pin #{pins[0]}"
  	@back_pin    = "pin #{pins[1]}"
  end

  def forward
  	puts "#{forward_pin} ON // #{back_pin} OFF"
  end

  def back
  	puts "#{forward_pin} OFF // #{back_pin} ON"
  end

  def stop
  	puts "#{forward_pin} OFF // #{back_pin} OFF"
  end

end