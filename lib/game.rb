class Game

attr_accessor :player_1, :player_2, :board


 WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]


def initialize(player_1=("X"),player_2=("O"),board=Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def player_1
  @player_1
end

def turn_count
  counter = 0
  self.board.cells.each do |play|
    if play == self.player_1.token.to_s || play == self.player_2.token.to_s
      counter += 1
    end
  end
  return  counter
end

def current_player
  count = turn_count
  if count%2 ==0 || count == 0
    return self.player_1.token
  else
    return self.player_2.token
  end
end

def won?


  WIN_COMBINATIONS.each do |win_combination|

    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    position_1= self.board.cells[win_index_1]
    position_2= self.board.cells[win_index_2]
    position_3= self.board.cells[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end


  end

  if self.board.cells.empty?
    return false
  end




end

def over?
  set = won?
  if set.nil? && full?
    return true
  end
  draw?
  won?
end

def play

   until over?
       turn
   end




  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
   puts "Cat's Game!"
  end


 end


end
