class Board
  attr_reader :playerX, :playerO
  attr_accessor :win

  def initialize(playerX, playerO)
    @new_board = [['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']]
    @playerX = playerX
    @playerO = playerO
    @win = false
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

  def check_win
    @new_board.each do |array|
      if array[0] == 'X' && array[1] == 'X' && array[2] == 'X' || 
        array[0] == 'O' && array[1] == 'O' && array[2] == 'O'
        return "Winner!"
      end
    end
    if @new_board[0][0] == 'X' && @new_board[1][1] == 'X' && @new_board[2][2] == 'X'
      return "Winner!"
    elsif @new_board[0][0] == 'O' && @new_board[1][1] == 'O' && @new_board[2][2] == 'O'
      return "Winner!"
    elsif @new_board[0][2] == 'X' && @new_board[1][1] == 'X' && @new_board[2][0] == 'X'
      return "Winner!"
    elsif @new_board[0][2] == 'O' && @new_board[1][1] == 'O' && @new_board[2][0] == 'O'
      return "Winner!"
    elsif @new_board[0][0] == 'X' && @new_board[1][0] == 'X' && @new_board[2][0] == 'X'
      return "Winner!"
    elsif @new_board[0][0] == 'O' && @new_board[1][0] == 'O' && @new_board[2][0] == 'O'
      return "Winner!"
    elsif @new_board[0][1] == 'X' && @new_board[1][1] == 'X' && @new_board[2][1] == 'X'
      return "Winner!"
    elsif @new_board[0][1] == 'O' && @new_board[1][1] == 'O' && @new_board[2][1] == 'O'
      return "Winner!"
    elsif @new_board[0][2] == 'X' && @new_board[1][2] == 'X' && @new_board[2][2] == 'X'
      return "Winner!"
    elsif @new_board[0][2] == 'O' && @new_board[1][2] == 'O' && @new_board[2][2] == 'O'
      return "Winner!"
    else
      count = 0
      @new_board.each do |array|
        count += 1 unless array.include? '.'
      end
      return "Tie!" if count == 3
    end
  end

  public

  def turn(player)
    puts "Enter row and then column!"
    set_position(player)
    print_board()
    if check_win() == "Winner!"
      puts "Winner!"
      self.win = true
    elsif check_win() == "Tie!"
      puts "Tie!"
      self.win = true
    end
  end
end

game = Board.new('X', 'O')

while 1
  game.turn(game.playerX)
  break if game.win == true
  game.turn(game.playerO)
  break if game.win == true
end