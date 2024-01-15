from validations import askforname, valEmail, valPassCon, valPhone , generate_id

from files import saveuser
  

def register_process():

    print(' =====welcome new comer===== ')

    Fname = askforname("First Name : ")

    Lname = askforname("Last Name : ")

    Email = valEmail("E-mail : ")

    Password = input("Password : ")

    CPassword = valPassCon(Password, "Confirm your password : ")

    Phone = valPhone("enter your Mobile phone : ")
    u_id = 0
    u_id =   generate_id()

    u_data = {"id":u_id,
              "FirstName": Fname,
              "LastName": Lname, 
              "Email Address":Email,
              "Password": Password,
              "Phone Number": Phone
            }
    
    saveuser(u_data)
    print("Success")
    return