from validations import askfornum, valDate
from project import search_projects
def search_entry():
    while True :
        print(" ====Search Project==== ")
        print(" Chose the filter to search With : ")
        print (' 1) id         2) Date         3) Title')
        print (' 4) Budget     5) Exit')
        cho =  askfornum('Yours :')
        if cho == 1:
            project_id = askfornum(" Enter the project id :   ")
            project_id = str(project_id)
            omega = search_projects(search_param='id', search_value=project_id)
            if omega :
                print(omega)
            else :
                print('No projects at this period')
            return
        elif cho == 2:
            project_date = valDate(" Enter the period :   ")
            project_date = str(project_date)
            alfa = search_projects(search_param='date', search_value=project_date)
            if alfa :
                print(alfa)
            else :
                print('No projects at this period for this user')
        elif cho == 3:
            project_title = input(" Enter the title :   ")
            project_title = str(project_title)
            alfa = search_projects(search_param='title', search_value=project_title)
            if alfa :
                print(alfa)
            else :
                print('No projects with this title')
        elif cho == 4:
            project_flooos = askfornum(" Enter the budget :   ")
            project_flooos = str(project_flooos)
            alfa = search_projects(search_param='budget', search_value=project_flooos)
            if alfa :
                print(alfa)
            else :
                print('No projects with this budget')
            return
        elif cho == 5:
            return
        else :
            print("Invalid input")
            continue
    
