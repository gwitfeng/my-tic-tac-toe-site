 # my-tic-tac-toe-site 2017-11-19 #

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]
# ttt.rb
 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def turn(board)

  counter = 1
  while counter <= 9 && !won?(board)
    puts "第 #{counter} 回合，輪到 #{current_player(counter)}"
    play(board, counter)
    counter = counter + 1
  end
  if won?(board)
    puts "#{winner(board)} 贏了！"
  else
    puts "平手！沒有人贏！"
  end
  puts "遊戲結束"
  
end

def play(board, counter)

  if current_player(counter) == "X"
    puts "請選出你要下棋的位置，請輸入 1-9："
    input = gets.chomp
    position = input.to_i - 1
  else
    puts "換電腦下棋"
    position = computer_play(board)
  end
  if valide_move?(board, position)
     board[position] = current_player(counter)
     display_board(board)
  else
     play(board, counter) 
  end 

end

# 電腦選棋

def computer_play(board)
  avail_position(board).sample
end

def avail_position(board)
  avail_position = Array.new
  board.each_with_index do |input, index|
    if input == " "
      avail_position << index
      # 上面程式碼等同於 avail_position.push(index)
    end
  end
  avail_position
end


def current_player(counter)
  if counter % 2 == 0
    return "O"
  else
    return "X"
  end
end

def won?(board)
  # 如果有滿足到贏的組合，就回傳 True
  WIN_COMBINATIONS.each do |win_combo|
    if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ) || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O" )
      return win_combo
    end
  end
  # 如果都沒人贏，就回傳 False
  return false
end

def winner(board)
  win_combo = won?(board)
  if win_combo
    winner = board[win_combo[0]]
    return winner
  end
end

def valide_move?(board, position)
  position >= 0 && position < 9 && board[position] == " "
end



###################################

# 執行程序

puts "你開啟了一局新的井字遊戲！"
puts "請以 1-9 數字對應棋盤位置"
display_board([1,2,3,4,5,6,7,8,9])

board = [" "," "," "," "," "," "," "," "," "]
turn(board)
play(board,counter)
computer_play(board)
avail_position(board)
valide_move?(board, position)
current_player(counter)
won?(board)
winner(board)

