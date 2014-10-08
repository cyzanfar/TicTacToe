class Morpion
    
   def initialize  
      create_grid
      init_player
      show_grid
   end
   def init_player
      puts "Let play some Tic Tac Toe"
      puts ""
      @player1 ='X' 
      @player2='O'
          puts ""
          puts "Where would you like to move? (check out the grid below and type any number 1-9 to place your symbol): "
          puts " 1 | 2 | 3 "
          puts "---+---+---"
          puts " 4 | 5 | 6 "
          puts "---+---+---"
          puts " 7 | 8 | 9 "
   end
   
   def create_grid     # creating a hash with each value representing a cell (1-9)
        @grid = {
            '1' => ' ',
            '2' => ' ',
            '3' => ' ',
            '4' => ' ',
            '5' => ' ',
            '6' => ' ',
            '7' => ' ',
            '8' => ' ',
            '9' => ' '
        }
   end
      
    def show_grid
        puts ""
        puts "#{@grid['1']}|#{@grid['2']}|#{@grid['3']}"
        puts "-----"
        puts "#{@grid['4']}|#{@grid['5']}|#{@grid['6']}"
        puts "-----"
        puts "#{@grid['7']}|#{@grid['8']}|#{@grid['9']}"
        puts ""
    end
      
   def play
       number_turns=1
       while number_turns < 10   # looping 9 times where odd is player1 and even is player 2
        number_turns.odd? ? player_turn(@player1) : player_turn(@player2)
        if game_checker # break the loop if a player won meaning if end_game=true
         break
        end
        number_turns+=1
       end  
   end
   
   def player_turn(player)
        puts player == 'X' ? "X's turn" : "O's turn"
        puts ""
        cell = gets.chomp
        if (@grid.keys.include?(cell) && @grid[cell] == ' ') # check if the user entered a number corresponding to the grid and if the cell is empty
            @grid[cell] = player
        else
            puts ""
            puts "it has to be a number from 1 to 9"
            player_turn(player)  
        end
        show_grid
   end
   
   def game_checker # checking all possible winning combination
        end_game = false
        # condition is whether cells are equal to each other and not empty!
        if    ((@grid['1'] == @grid['2'] && @grid['1'] == @grid['3']) && (@grid['1'] != ' ' && @grid['2'] != ' ' && @grid['3'] != ' ')) 
            end_game=true
            victory=@grid['1']
        elsif ((@grid['4'] == @grid['5'] && @grid['4'] == @grid['6']) && (@grid['4'] != ' ' && @grid['5'] != ' ' && @grid['6'] != ' '))
            end_game=true
            victory=@grid['4']
        elsif ((@grid['7'] == @grid['8'] && @grid['7'] == @grid['9']) && (@grid['7'] != ' ' && @grid['8'] != ' ' && @grid['9'] != ' '))
            end_game=true
            victory=@grid['7']
        elsif ((@grid['1'] == @grid['4'] && @grid['1'] == @grid['7']) && (@grid['1'] != ' ' && @grid['4'] != ' ' && @grid['7'] != ' '))
            end_game=true
            victory=@grid['1']
        elsif ((@grid['2'] == @grid['5'] && @grid['2'] == @grid['8']) && (@grid['2'] != ' ' && @grid['5'] != ' ' && @grid['8'] != ' '))
            end_game=true
            victory=@grid['2']
        elsif ((@grid['3'] == @grid['6'] && @grid['3'] == @grid['9']) && (@grid['3'] != ' ' && @grid['6'] != ' ' && @grid['9'] != ' '))
            end_game=true
            victory=@grid['3']
        elsif ((@grid['1'] == @grid['5'] && @grid['1'] == @grid['9']) && (@grid['1'] != ' ' && @grid['5'] != ' ' && @grid['9'] != ' '))
            end_game=true
            victory=@grid['1']
        elsif ((@grid['7'] == @grid['5'] && @grid['7'] == @grid['3']) && (@grid['7'] != ' ' && @grid['5'] != ' ' && @grid['3'] != ' '))
            end_game=true
            victory=@grid['7']
        else
            end_game=false
        end
      
    
      if end_game 
           puts "the victory of this game is #{victory}"
           puts ""
           puts "----------//-------------"
           puts "-------------------------"
           puts "---The Flatiron School---"
           puts "-------------------------"
           puts "----------//-------------"
           return true
        end
   end

   
end


m=Morpion.new
m.play
