class Board
  attr_reader :playerX, :playerO

  def initialize(playerX, playerO)
    @new_board = [['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']]
    @playerX = playerX
    @playerO = playerO
  end

  private

  def print_board
    @new_board.each do |row|
      p row
    end
  end

  def set_position(player)
    count = 0
    row = ''
    column = ''
    positions = ['0', '1', '2']
    get_position(player, positions, count, row, column)
    @new_board[row.to_i][column.to_i] = 'X'
  end

  def get_position(player, positions, count, row, column)
    loop do
      print "#{player}'s turn: "
      position = gets.chomp
      if positions.include? position
        count == 0 ? row = position : column = position
        count += 1
      else
        puts "Not a valid position!"
      end
      break if count > 1
    end
  end

  public

  def turn(player)
    puts "Enter row and then column!"
    set_position(player)
    print_board()
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