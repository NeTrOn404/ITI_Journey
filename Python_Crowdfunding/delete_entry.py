from validations import askfornum
from project import delete_project



def delete_entry(u_info) :
    while True :
        print(" ====Delete Project==== ")
        project_id = askfornum(" Enter the project id :   ")
        #search for the project id that the solution
        delete_project(u_info, project_id)
