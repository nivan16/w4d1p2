require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board #3x3 grid
    @next_mover_mark = next_mover_mark #:x
    @prev_move_pos = prev_move_pos # nil first iteration
  end

  def losing_node?(evaluator) # :X
    # full = board.none?{|pos| board.empty?(pos)}
    # if full && !board.won? && !board.tied?
    #   return true
    # end
    # false
    
      return true if board.winner != evaluator
      return false if board.tied?
      return false if board.winner == evaluator 

      self.children.each do |child|
        child.losing_node?(evaluator)
      end
    






      #done!

  end

  def winning_node?(evaluator)
      return true if board.winner == evaluator
      return false if board.tied?
      return false if board.winner != evaluator 

      self.children.each do |child|
        child.winning_node?(evaluator)
      end
    
  end 

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = [] 
    #we create the nodes!
      (0...3).each do |one|
        (0...3).each do |two|
          pos = [one, two] 
          new_board = board.dup
          prev_move_pos = pos
          next_mover_mark = (next_mover_mark == :o ? :x : :o  )  
          # if new_board[pos].is_a?(TicTacToeNode)    #why doesn't this work as a check :(
          if new_board.empty?(pos)
            new_board[pos] = TicTacToeNode.new(new_board, next_mover_mark, prev_move_pos)
            nodes << new_board[pos]
          end
        end
      end
    return nodes
  end





end
