class Board
  def initialize(player1, player2)
    @new_board = ""
    @player1 = Player.new(player1, black)
    @player2 = Player.new(player2, red)
  end
end

class Player < Board
  def initialize(name, color)
    @name = name
    @color = color
  end
end

board = [['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']]
board.each do |row|
  p row
end