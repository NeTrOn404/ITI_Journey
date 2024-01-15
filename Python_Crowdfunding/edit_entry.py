from validations import askfornum
from project import edit_project_info
from validations import valDate, askfornum


def edit_project_entry (u_info):              #prob : the user has to write the 
                                        # edits he wants before he know that there is a project with this id or not
    while True :
        print(" ====Edit Project==== ")
        project_id = askfornum(" Enter the project id :   ")
        print(" Choose an info to edit: ")
        print("   1) Title,    2) Details     3) Total_Target")
        print("   4) Start Date,    5) End Date     6) Exit")
        cho =  askfornum('Yours :')
        if cho == 1:
            n_title = input('New Title : ')
            edit_project_info(u_info, project_id, new_title=n_title, new_details=None, new_target=None, new_start_date=None, new_end_date=None)
            return
        elif cho == 2:
            n_details = input('New Details : ')
            edit_project_info(u_info ,project_id, new_title=None, new_details=n_details, new_target=None, new_start_date=None, new_end_date=None)
            return
        elif cho == 3:
            n_target = input('New_Target : ')
            edit_project_info(u_info ,project_id, new_title=None, new_details=None, new_target=n_target, new_start_date=None, new_end_date=None)
            return
        elif cho == 4:
            n_start_date = valDate('New Start Date : ')
            edit_project_info(u_info ,project_id, new_title=None, new_details=None, new_target=None, new_start_date=n_start_date, new_end_date=None)
            return
        elif cho == 5:
            n_end_date = valDate('New End Date : ')
            edit_project_info(u_info ,project_id, new_title=None, new_details=None, new_target=None, new_start_date=None, new_end_date=n_end_date)
            return
        elif cho == 6:
            return
        else :
            print("Invalid input/3")
            continue
    
