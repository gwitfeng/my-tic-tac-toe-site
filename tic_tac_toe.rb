 # my-tic-tac-toe-site 2017-11-19 #

 WIN_COMBINATIONS = [  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6] ]

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def play(board,counter) # 兩人輪流輸入 # 
    puts " 請選放入位置 "
    input = gets.chomp
    position = input.to_i - 1
    board[position] = current_player(counter)
    display_board(board)
  end


  def turn(board)# 輸入回合 #
    counter = 1
    while counter <= 9
      puts " 第 #{counter}  回合 "
      play(board,counter)
      counter = counter + 1
    end
  end



  def current_player(counter) # 玩家輸入內容 #
      if counter % 2 != 0  
           return "X"
       end
       if counter % 2 == 0    
           return  "○" 
       end 
  end


def won?(board)
  # 如果有滿足到贏的組合，就回傳 True
  
    if board[0] == "X" && board[1] == "X" && board[2] == "X" 
     puts " X  win ! "
    end

    if board[0] == "○" && board[1] == "○" && board[2] == "○" 
     puts " ○ win !! " 
    end
  # 如果都沒人贏，就回傳 False

end


def winner(board)
  win_combo = won?(board)
  if win_combo
    winner = board[win_combo[0]]
    return winner
  end
  if winner
    print "winner is ",won?[board]
  else
    print " None win !! " 
   end
end



board = ["1","2","3","4","5","6","7","8","9"]
display_board(board)
turn(board)
play(board,counter)
current_player(counter)
won?(board)
winner(board)   


