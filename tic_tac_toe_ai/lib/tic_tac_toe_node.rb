require_relative 'tic_tac_toe'


class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil) #ASK TA ABOUT THIS INITIALIZE
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if board.over? && (board.winner != evaluator)
    # arr = self.children
    # new_arr = []
    # arr.each do |el|
    #   new_arr << el.children 
    # end
    # puts "arr"
    # puts arr
    # puts "new_arr"
    # puts new_arr
    
    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    arr = []
    (0..2).each do |row|
      (0..2).each do |col|
        position = [row, col]
        if board[position].nil?
          new_board = board.dup
          new_board[position] = next_mover_mark
          # prev_move_pos = new_board[row][col]
          if next_mover_mark == :x
            next_mover_mark = :o 
          else
            next_mover_mark = :x
          end
          arr << TicTacToeNode.new(new_board, next_mover_mark, position)
        end
      end
    end
    arr
  end
end


p t1 = TicTacToeNode.new(Board.new, :x, prev_move_pos = nil)
p t1.losing_node?(:x)