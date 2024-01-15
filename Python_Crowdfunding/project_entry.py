from project import crpro, view_project
from edit_entry import edit_project_entry
from delete_entry import delete_entry
from Search_Entry import search_entry


#project_flow :
def project_entry(u_info):
    while True :
        print(" ====Projects==== ")
        print(" Choose an option :   1) create project,     2) View All Projects,       3)Edit_project  ")
        print("                      4) Delete Project,     5) Search_projects,         6) Exit  ")
        cho = input('Yours :')
        if cho == '1':
            crpro(u_info)
        elif cho == '2' :
            view_project()
        elif cho == '3' :
            edit_project_entry(u_info)
        elif cho == '4' :
            delete_entry(u_info)
            return
        elif cho == '5' :
            search_entry()          
            return
        elif cho == '6' :
            return
        else :
            print("Invalid input")
            continue