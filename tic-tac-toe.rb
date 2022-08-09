class Board
  attr_reader :playerX, :playerO

  def initialize(playerX, playerO)
    @new_board = [['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']]
    @positions = {
      1 => @new_board[0][0],
      2 => @new_board[0][1],
      3 => @new_board[0][2],
      4 => @new_board[1][0],
      5 => @new_board[1][1],
      6 => @new_board[1][2],
      7 => @new_board[2][0],
      8 => @new_board[2][1],
      9 => @new_board[2][2]
    }
    @playerX = playerX
    @playerO = playerO
  end

  def turn(player)
    loop do
      print "#{player}'s turn: "
      @position = gets
      break if @positions.key?(@position.to_i)
      puts "Not a valid position!"
    end
    @positions[@position.to_i] = 'X'
  end
end

# board.each do |row|
#   p row
# end

game = Board.new('Bob', 'Jim')
while 1
  game.turn(game.playerX)
  game.turn(game.playerO)
end