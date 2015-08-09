class Hangman
	attr_accessor :secret_word, :guesses, :skeleton, :hidden_answer

	def initialize(secret_word)
		@secret_word = secret_word
		@guesses = guesses
		@skeleton = skeleton
		@hidden_answer = hidden_answer
	end

	def play
		puts "Whaddup and let's play!"
		puts "I know a secret word...wanna guess it or guess a letter"
		puts "Type WORD or LETTER"
		choice
		gets choice.chomps.downcase

		when choice
			case 'word'
				solver
			end
			case 'letter'
				guesser
			end
			when 'quit'
				break
			end
			else
				puts "Huh? Bro, I can't understand you. Say that again!?"
				play
			end 
		end
	end

	def solver
		puts "Oh, you think you can solve it HOTSHOT? What's the word, baby bird?\n"
		answer
		gets answer.chomps.downcase
		puts "Tisk Tisk Tisk. And I believed in you. Wrong answer, FOOL" unless answer == secret_word
		skeleton++
		is_dead?
	end

	def guesser
		puts "Guess a letter then!"
		letter
		gets letter
		secret_word.to_a

		secret_word.to_a {|char| if char == letter}
	end

	def is_dead?
		"RIP I just kilt the club, if the club was YOU!" if skeleton >= 9 && break
	end

end

game = Hangman.new("pikachu")
game