class Board

  def initialize()
    @new_board = [['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']]
    create_players()
  end

  def create_players()
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
  end
end

class Player < Board
  def initialize(name)
    @name = name
  end
end

positions = {
  1 => "[0][0]",
  2 => "[0][1]",
  3 => "[0][2]",
  4 => "[1][0]",
  5 => "[1][1]",
  6 => "[1][2]",
  7 => "[2][0]",
  8 => "[2][1]",
  9 => "[2][2]",
}

p positions[1]

# board.each do |row|
#   p row
# end

game = Board.new
