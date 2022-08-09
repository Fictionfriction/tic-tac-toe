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
    positions = ['0', '1', '2']
    position = get_position(player, positions)
    @new_board[position[0].to_i][position[1].to_i] = player
  end

  def get_position(player, positions)
    count = 0
    row = ''
    column = ''
    loop do
      print "#{player}'s turn: "
      position = gets.chomp
      if positions.include? position
        count == 0 ? row = position : column = position
        if count == 1
          unless @new_board[row.to_i][column.to_i] == '.'
            puts 'Already an X or O there! Try again!'
            row = ''
            count = 0
            column = ''
            next
          end
        end
        count += 1
      else
        puts "Not a valid position!"
      end
      break if count > 1
    end
    return [row, column]
  end

  public

  def turn(player)
    puts "Enter row and then column!"
    set_position(player)
    print_board()
  end
end

game = Board.new('X', 'O')

while 1
  game.turn(game.playerX)
  game.turn(game.playerO)
end