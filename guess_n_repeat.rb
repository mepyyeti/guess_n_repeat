#!/usr/bin/env ruby

print "Hello. Enter your name: "
my_name = gets.chomp.to_s
print "welcome, #{my_name}!\n"

repeat = true

while repeat
	print "how many tries do you want? "
	num_of_tries = gets.to_i
	original = num_of_tries
	
	secret_num = rand(10)+1
	#p secret_num => trouble shoot correct answer
	guessed = false
	history = []
	history.push("name:",my_name,"guesses:")

	until num_of_tries == 0 || guessed
		
		if num_of_tries == 1
			puts "this is your last try"
		elsif num_of_tries == original
			puts "ok we begin.."
		else 
			puts "you have #{num_of_tries} tries left"
		end
		
		num_of_tries -= 1
		print "enter your guess: "
		guess = gets.to_i
		history.push(guess)
		
		if guess < secret_num
			puts "LOW"
		elsif guess > secret_num
			puts "HIGH"
		else
			puts "good job"
			guessed = true
			history.push("SUCCESS")
		end	
	end
	
	unless guessed
		puts "sorry you ran out of tries..."
		history.push("FAIL","answer:",secret_num)
		puts "secret number was #{secret_num}"
	end
	
	history_writer = File.new("my_history.txt", "a")
	history_writer.write("\n#{history}")
	history_writer.close
	
	print "want to read your results? [y/n] "
	choice = gets.chomp
	
	if choice == 'y'|| choice == 'yes'
		puts File.read("my_history.txt")
	end
	print "wish to go again? [y/n] "
	input = gets.chomp

	if input == 'y' || input == 'yes'
		history=[]
		next
	else
		repeat = false
		print "goodbye"
	end
end

__END__

also history_reader = File.open("my_history");history_reader.each do |l| puts l end

