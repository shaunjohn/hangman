class Hangman
	attr_accessor :secret_word, :chances_taken, :hidden_answer, :past_attempts, :set_chances

	def initialize(secret_word)
		@secret_word = secret_word
		@chances_taken = 0 # initialized to zero wrong guesses to start
		@set_chances = 5 #set total of wrong guesses in hangman game
		@hidden_answer = secret_word.split('') #transformed secret word into array of characters
		@past_attempts = [] #empty array to hold total guesses of words AND letters
		start
	end

	def start
		puts "Whaddup and let's play!\nI know a secret word...\n\n"
		gameplay
	end

	def gameplay
		puts "Wanna guess a WORD or guess a LETTER\nType WORD or LETTER"
		choice = gets.chomp.downcase
		case choice
			when 'word'
				word_solver
			when 'letter'
				letter_guesser
			when 'quit'
				abort("Sorry to see you go!\n")
			else
				puts "\nHuh? Bro, I can't understand you. Say that again!?\n\n"
				gameplay
		end
	end

	def word_solver
		puts "\nOh, you think you can solve it HOTSHOT? What's the word, baby bird?\n"
		answer = gets.chomp.downcase
		log_attempt(answer) 
		is_right?(answer)
		is_dead?
	end

	def letter_guesser
		puts "\nGuess a letter then!\n"
		letter = gets.chomp.downcase
		log_attempt(letter)
		temp_word = hidden_answer.map {|x| past_attempts.include?(x) ? x = x : x = "*" } # if hidden_answer element is found in past_attempts, show it...otherwise, anonymize as asterisk
		puts "\nSo far the word is #{temp_word.join}\n"
		is_solved?
		secret_word.include?(letter) ? gameplay : is_dead? # if good guess, keep guessing without penalty. Else, add to chances_taken
	end

	def log_attempt(attempt)
		past_attempts << attempt #running log of all attempts
	end

	def is_right?(answer)
		puts (answer == secret_word) ? abort("\nYOU ROCK! Totally Right...GOODBYE\n") : "\nTisk Tisk Tisk. And I believed in you. Wrong answer, FOOL\n"
	end

	def is_solved?
		puts (hidden_answer-past_attempts).empty? ? abort("\nCall Vana White, you guessed all the letters\nYOU WIN!!!\n") : "\nYet still so much more to guess!\n"
	end

	def is_dead?
		self.chances_taken += 1
		puts "Chances taken/left: #{chances_taken} / #{set_chances}"
		(self.chances_taken >= set_chances) ? abort("\nRIP I just kilt the club, if the club was YOU!\nYou Lose. GAME OVER") : gameplay
	end
end

game = Hangman.new("pikachu")
game