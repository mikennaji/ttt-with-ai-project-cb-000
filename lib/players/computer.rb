module Players

class Computer < Player
  def move(board)
    input = rand 1..9
    return input.to_s
  end


end

end
