def pizza_order():
    print("Hello!, Welcome to Pizza Restaurant. \
    \nThis is auto chatbot. \
    \nIf you want to finish conversation, type 'done'\n")
    name = input("What's your name? : ")
    menu = ["pizza", "salad", "coke"]

    print(f"\nHi, {name}.")
    print(f"This is our recommend.{menu}")

    foods = []

    while True:
        food = input("\nWhat do you want for today? (type 'done' to exit): ")
        if food == "done" :
            return print(f"\nHere is your order : \n{foods}")
        elif food == "pizza":
            more = "yes"
            while more == "yes":

                size_pizza = input("Please select size. (s, m, l) : ")
                crust_pizza = input("Please select crust. (pan, thin) : ")
                topping_pizza = input("Please select topping. (seafood, hawaiian, etc..)")
                amount_pizza = input("How many pizza do you want? : ")
                pizza = f"pizza size {size_pizza} and {crust_pizza} crust with {topping_pizza} topping for {amount_pizza}"
                print(f"\nSure, {pizza}\n")
                foods.append(pizza)

                more = input("Do you want to order more pizza? (yes, no) : ")

            food = input("Anything else? (yes, no) : ")

            if food == "no" :
                return print(f"\nHere is your order : \n{foods}")

        elif food == "salad":
            more = "yes"
            while more == "yes":

                dressing_salad = input("Please choose salad dressing. (ceasar, vegan cream) : ")
                amount_salad = input("How many salad do you want? : ")
                salad = f"salad with {dressing_salad} dressing for {amount_salad}"
                print(f"\nSure, {salad}\n")
                foods.append(salad)

                more = input("Do you want to order more salad? (yes, no) : ")

            food = input("Anything else? (yes, no) : ")

            if food == "no" :
                return print(f"\nHere is your order : \n{foods}")

        else:
            amount = input(f"How many {food} do you want? : ")
            foods.append(f"{food} for {amount}")

