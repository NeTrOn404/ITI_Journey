import re
import  time
import datetime

def askforname(message):
    while True:
        name = input(message)
        if name.isalpha():
            return name.lower()
        print("=== not vaild name ====")

def askfornum(message):
    while True:
        try:
            num = int(input(message))
        except Exception as e:
            print("---- please enter an integer: ")
        else:
            return num
        
def valEmail(message):
    regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b'
    while True:
        email = input(message)
        if(re.fullmatch(regex, email)):
            return email
        print("--- invalid email please enter it again ---")

def valPassCon(password,message):
    while True:
        ConfirmPassword = input(message)
        if password == ConfirmPassword:
            return ConfirmPassword
        print("Password and confirmation doesn't match")

def valPhone(message):
    while True:
        phone = input(message)
        if len(phone) == 11  and  phone.isdigit()  :
            if re.match(r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}', phone) :
                return phone
              
        print("not valid phone.")



def generate_id():
    "generate random id "
    u_id = time.time()
    u_id = round(u_id)
    u_id = int(u_id)
    return u_id



def valDate(message):
    while True:
        Date = input(message)
        try:
          date_format = '%Y-%m-%d'
          dateObject = datetime.datetime.strptime(Date, date_format)
          return str(dateObject)
        except ValueError:
          print("Incorrect data format, should be YYYY-MM-DD")
          return None


