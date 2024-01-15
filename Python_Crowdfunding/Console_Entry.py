from register_process import register_process
from login import login_process
from project_entry import project_entry
from validations import askfornum
# main flow :

def console_entry():
    while True :
        print(" Welcome to my crowdfunding app ")
        print(" Choose an option :   1) Login,    2) Register     3) Exit")
        cho =  askfornum('Yours :')
        if cho == 2: 
                register_process()
                u_info = login_process()
                project_entry(u_info)
                continue
        elif cho == 1:
            u_info = login_process()
            project_entry(u_info)
            continue
        elif cho == 3:
            exit()
        else :
            print("Invalid input")
            continue



if __name__ == '__main__':
     console_entry()
