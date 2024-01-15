from validations import  valEmail
from files import  all_users

def login_process():
    while True :
        print("hi ya zbooon")
        Email = valEmail("enter your Email : ")
        Password = input("enter your password : ")
        userID = login_search(Email, Password)
        if userID :
            print("Sucess")
            
            return userID
        else :
            print("you don't have an account")

def login_search(email,password):
    my_users = all_users()
    for user in my_users :
        if email == user.get("Email Address") and password == user.get("Password"):
            b = user.get("id")
            return b
    print("invalid cardentiality")
    return False
