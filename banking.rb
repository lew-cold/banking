bal = IO.read('bal.txt')
bal = bal.to_i
balance1 = Array.new
balance1.push bal

his = IO.read('his.txt')
history1 = Array.new
history1.push his

def deposit(balance1, history1)
    puts "how much do you want to deposit?"
    input = ' '
    input = gets.chomp.to_i
    puts "You are depositing $#{input}"
    balance1.push input
    history1 << (input)
    puts write(balance1, history1)
end

def withdraw(balance1, history1)
    puts "how much would you like to withdraw?"
    input = ' '
    input = gets.chomp.to_i
    if balance1.sum < input 
        puts error
    else
    puts "You have chosen to withdraw $#{input}"
    balance1.push -input
    history1 << -input
    puts write(balance1, history1)
    end
end

def history(balance1, history1)
    puts "This is your entire transaction record"
    puts "\n"
    puts history1
    puts "\n"
    puts balance(balance1, history1)
end

def balance(balance1, history1)
    puts "Your balance is $#{balance1.sum}"
    puts replay(balance1, history1)
end


def replay(balance1, history1)
    puts "Would you like to carry out another transaction, y or n?"
    reply = gets.chomp
    if reply == "y"
        clear
        welcome(balance1, history1)
    elsif reply == "n"
        clear
        exitnow
    else
        puts "INVALID RESPONSE. Try again."
        replay(balance1, history1)
    end
end

def write(balance1, history1)
    x = balance1.sum
    y = history1

    IO.write('bal.txt', x)
    IO.write("his.txt", y.join("\n"))
    puts balance(balance1, history1)
end

def error
    puts "Invalid selection, please try again!"
end

def clear
    system("clear")
end

def exitnow
    puts "Thank you for banking with us!"
    exit
end


def welcome(balance1, history1)
    puts "Welcome to the banking app, Please input either d: deposit, w: withdraw, b: balance, h: account history or e: exit.  
    You may wish to check your balance first before proceeding"

    response = gets.chomp.downcase

    case response
        when "d"
            deposit(balance1, history1)
        when "b"
            balance(balance1, history1)
        when "w"
            withdraw(balance1, history1)
        when "e"
            exitnow
        when "h"
            history(balance1, history1)
        else
            clear
            error
            welcome(balance1, history1)
    end
end

def pin_check(balance1, history1)
    pin = 1234
    puts "Please enter your pin to continue"
   pincheck = gets.chomp.to_i
   
   if pincheck == pin
        clear
       welcome(balance1, history1)
    else
        clear
        puts "Incorrect pin, please reload app."
       exitnow
    end
end

puts pin_check(balance1, history1)

#counter, keeps track of the error count.
#sudo code step 1
