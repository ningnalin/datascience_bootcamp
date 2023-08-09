### เป่ายิงฉุบ
import random


choice = ["hammer", "scissor", "paper"]

def play_game():
    print("Welcome to เป่ายิงฉุบ")
    print("Type 'stop' to quit game.\n")
    user_name = input("What is your name? : ")
    print(f"Are you ready? You have 3 choices: {choice}")

    user_point = 0
    computer_point = 0


    while True:
        user_select = input("\nYou choose one: ")
        computer_select = random.choice(choice)

        if user_select == "stop":
            if user_point > computer_point:
                print("\nCongratulation! You win!! 🥳 \nScore".upper())
            elif user_point < computer_point:
                print("\nSorry, You lost!! 😭\nSCORE".upper())
            else:
                print("\nWow, Tie!! 🙌🏻\nScore".upper())


            return f"{user_name} {user_point} : {computer_point} Computer"

        else:
            if user_select == computer_select:
                print(f"Computer chose: {computer_select}")
                print("tie!")
            elif user_select == "hammer" and computer_select == "scissor":
                print(f"Computer chose: {computer_select}")
                print("You win!")
                user_point += 1
            elif user_select == "hammer" and computer_select == "paper":
                print(f"Computer chose: {computer_select}")
                print("You lost!")
                computer_point += 1
            elif user_select == "scissor" and computer_select == "paper":
                print(f"Computer chose: {computer_select}")
                print("You win!")
                user_point += 1
            elif user_select == "scissor" and computer_select == "hammer":
                print(f"Computer chose: {computer_select}")
                print("You lost!")
                computer_point += 1
            elif user_select == "paper" and computer_select == "scissor":
                print(f"Computer chose: {computer_select}")
                print("You lost!")
                computer_point += 1
            elif user_select == "paper" and computer_select == "hammer":
                print(f"Computer chose: {computer_select}")
                print("You win!")
                user_point += 1
            else:
                print(f"\n❌ Sorry, Please check your spelling. \nChoose again!: {choice}")

play_game()
