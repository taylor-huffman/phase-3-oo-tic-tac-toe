require "pry"

class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end


    def input_to_index(input)
        input.to_i-1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        !position_taken?(index) && index >= 0 && index <= 8
    end

    def turn_count
        @board.count do |token|
            token == "X" || token == "O"
        end
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Enter a number between 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        result = nil
        WIN_COMBINATIONS.each do |combo|
            won = (@board[combo[0]] != " ") && (@board[combo[0]] == @board[combo[1]]) && (@board[combo[1]] == @board[combo[2]])
            if won
                result = combo
            end
        end
        result
    end

    def full?
        turn_count >=9
    end

    def draw?
        turn_count >=9 && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        if !won?
            nil
        else
            @board[won?[0]]
        end
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
        won?
    end
end