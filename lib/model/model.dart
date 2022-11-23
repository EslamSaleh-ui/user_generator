// ignore_for_file: file_names
// ignore_for_file: non_constant_identifier_names

class Generate_User
{
  String id,title,f_name ,l_name,
  city,state,country,postal_code,timezone,coordinates,address,cell,
  phone,email,dob,age, uer_name,password,gender,img;

  Generate_User() {}
  Generate_User.fromMap(Map<String,dynamic> object)
  {
    id=object['id'];
    title=object['title'];
    f_name=object['f_name'];
    l_name=object['l_name'];
    address=object['address'];
    cell=object['cell'];
    city=object['city'];
    state=object['state'];
    country=object['country'];
    postal_code=object['postal_code'];
    timezone=object['timezone'];
    coordinates=object['coordinates'];
    phone=object['phone'];
    email=object['email'];
    dob=object['dob'];
    age=object['age'];
    uer_name=object['uer_name'];
    password=object['password'];
    gender=object['gender'];
    img=object['img'];
  }
  Map<String,dynamic> toMap()=>{'id':id,'title':title,'f_name':f_name,'cell':cell,
 'l_name':l_name,'coordinates':coordinates,'city':city,'phone':phone,'email':email,
 'dob':dob,'age':age,'uer_name':uer_name,'password':password, 'gender':gender,'address':address,
  'img':img,'state':state,'country':country,'timezone':timezone,'postal_code':postal_code };
}