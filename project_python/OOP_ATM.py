# ATM OOP
# ฝาก ถอน โอน เปลี่ยนรหัส เติมเงิน

class ATM:
    # Create ATM Class
    def __init__(self, id_card:int, name, bank, password:int, balance=0):
        self.id_card = id_card
        self.name = name
        self.bank = bank
        self.password = password
        self.balance = balance

    # deposit method
    def deposit(self, amt):
        input_password = int(input("Please input your password : "))
        if input_password == self.password:
            self.amt = amt
            self.balance += amt
            print(f"Your balance is: {self.balance}")
        else:
            print("Sorry!, Your password is incorrect!!")

    # withdraw method
    def withdraw(self, amt):
        input_password = int(input("Please input your password : "))
        if input_password == self.password:
            if self.balance < amt:
                print("Sorry, your balance is not enough!")
            else:
                self.amt = amt
                self.balance -= amt
                print(f"Your balance is: {self.balance}")
        else:
            print("Sorry!, Your password is incorrect!!")

    # transfer method
    def transfer(self, other_account, amt):
        input_password = int(input("Please input your password : "))
        if input_password == self.password:
            if self.balance < amt:
                print("Sorry, your balance is not enough!")
            else:
                self.amt = amt
                self.balance -= amt
                other_account.balance += amt
                print(f"Success! Your transfer has been confirmed.")
                print(f"Your balance is: {self.balance}")
        else:
            print("Sorry!, Your password is incorrect!!")

    # change password method
    def change_password(self):
        input_password = int(input("Please input your password : "))
        if input_password == self.password:
            input_id = int(input("Please input your id : "))
            if input_id == self.id_card:
                while True:
                    new_password = int(input("Please input new password : "))
                    recheck_new_password = int(input("Confirm new password : "))
                    if new_password == recheck_new_password:
                        self.password = new_password
                        return "Password changed"
                    else:
                        print("Sorry!, Your password is incorrect.\nPlease Try again.")
            else:
                print("Sorry!, Your id card is incorrect!!")
        else:
                print("Sorry!, Your password is incorrect!!")

    # top up easy pass method
    def topup_easypass(self):
        input_password = int(input("Please input your password : "))
        if input_password == self.password:
            while True:
                easy_pass_id = input("Easy Pass id :")
                amount = input("Top up amount : ")
                confirm = input(f"Please confirm top up {amount} to {easy_pass_id} (yes/no): ")
                if confirm == "yes":
                    return "Success! Your top up has been confirmed."
                else:
                    print("Please input top up detail again")
        else:
                print("Sorry!, Your password is incorrect!!")
