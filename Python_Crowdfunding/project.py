from validations import askfornum, valDate, generate_id
from files import all_pros, savepro, save_edited_projects_data
def crpro(u_info) :
    Title = input("Pro.Title : ")
    Details = input("Pro.Details : ")
    Total_Target = askfornum("Pro.Total_Target : ")
    startDate = valDate("Pro.StartDate : ")
    endDate = valDate("Pro.EndDate : ")
    p_id    = 0
    p_id    = generate_id()
    p_data = {
              "p_id":p_id,
              "p_id_user": u_info,
              "Pro.Title": Title,
              "Pro.Details": Details, 
              "Pro.Total_Target":Total_Target,
              "Pro.StartDate": startDate,
              "Pro.EndDate": endDate
              }
    savepro(p_data)
    print('Success')
    return


def view_project() :
    pros = all_pros()
    for pro in pros :
        print(pro)

def edit_project_info( u_info, project_id, new_title=None, new_details=None, new_target=None, new_start_date=None, new_end_date=None): # u_info
    projects_data = all_pros()
    for project in projects_data:
        if project['p_id'] == project_id and str(project['p_id_user']) == str(u_info):
            
            if new_title is not None:
                project['Pro.Title'] = new_title
            if new_details is not None:
                project['Pro.Details'] = new_details
            if new_target is not None:
                project['Pro.Total_Target'] = new_target
            if new_start_date is not None:
                project['Pro.StartDate'] = new_start_date
            if new_end_date is not None:
                project['Pro.EndDate'] = new_end_date

            save_edited_projects_data(projects_data)
            print('Success')
            return


    print("Project not Yours.")
    return False
    

def delete_project(u_info, project_id):
    projects_data = all_pros()

    for project in projects_data:
        if project['p_id'] == project_id and str(project['p_id_user']) == str(u_info):
            projects_data.remove(project)
            save_edited_projects_data(projects_data)
            print('Success')
            return True

    print("Project not Yours.")
    return False


### f
def search_projects(search_param, search_value):
    projects_data = all_pros()
    result_projects = []

    for project in projects_data:
        if search_param == 'id' and project['p_id'] == search_value:       #if project['p_id'] == project_id and str(project['p_id_user']) == str(u_info)
            result_projects.append(project)
        elif search_param == 'date':
            start_date = project['Pro.StartDate'].split()[0]  
            end_date = project['Pro.EndDate'].split()[0] 
            if start_date <= search_value <= end_date:   
                result_projects.append(project)
        elif search_param == 'title' and project['Pro.Title'].lower() == search_value.lower():
            result_projects.append(project)
        elif search_param == 'budget' and project['Pro.Total_Target'] == search_value:
            result_projects.append(project)

    return result_projects