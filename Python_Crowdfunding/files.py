import json

# users :

def saveuser(u_data: dict) :
    old_data = all_users() 
    old_data.append(u_data)
    valid_data = json.dumps(old_data, indent=2)
    try:
        f_obj = open('my_users.json','w')
    except Exception as e :
        print("can't find the file")
        return False
    else :
        f_obj.write(valid_data)
        f_obj.close()
        return  True

def all_users():
    try:
        f_obj = open('my_users.json','r')
    except Exception as e :
        print(e)
    else :
        data = f_obj.read()
        f_obj.close()
        data= data.strip('\n')
        if data:
            file_data = json.loads(data)
            return  file_data
        return []



# project :

def savepro(p_data: dict) :
    old_pros = all_pros() 
    old_pros.append(p_data)
    valid_pros = json.dumps(old_pros, indent=2)
    try:
        f_obj = open('my_pros.json','w')
    except Exception as e :
        print("can't find the file")
        return False
    else :
        f_obj.write(valid_pros)
        f_obj.close()
        return  True
    


def all_pros():
    try:
        f_obj = open('my_pros.json','r')
    except Exception as e :
        print(e)
    else :
        data = f_obj.read()
        f_obj.close()
        data= data.strip('\n')
        if data:
            file_data = json.loads(data)
            return  file_data
        return []


def save_edited_projects_data(projects_data):
    with open('my_pros.json', 'w') as file:
        json.dump(projects_data, file, indent=2)