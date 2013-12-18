class Robot
  def move_forward
    stub_robot 'moving foward'
  end

  def move_back
    stub_robot 'moving back'
  end

  def move_right
    stub_robot 'moving right'
  end

  def move_left
    stub_robot 'moving left'
  end

  def stop_moving
    stub_robot 'stopped'
  end

private 
  def stub_robot output
    puts "stubbing robot #{output}"
    true
  end
  
end