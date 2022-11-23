// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/random_user.dart';
import 'package:serverpod/model/model.dart';

final p=ChangeNotifierProvider<controller>((ref) =>controller());

class controller extends ChangeNotifier{
  final api = RandomUser();
  Generate_User generated_user=Generate_User();
  void generate_user()async
  {    final user = await api.getUser();
     Map<String,dynamic>    e={'id':'${user.id.name} ${user.id.value}','title':user.name.title,'f_name':'${user.name.first}', 'l_name':user.name.last,
       'phone':user.phone,'email':user.email, 'dob':user.dob.date,'age':user.dob.age.toString(),'uer_name':user.login.username,
       'password':user.login.password,'city':user.location.city,'state':user.location.state, 'gender':user.gender,'address':user.location.street,
       'img':user.picture.large, 'country':user.nat,'timezone':'${user.location.timezone.description} ${user.location.timezone.offset}',
       'coordinates':'${user.location.coordinates.longitude}-${user.location.coordinates.latitude}',
       'postal_code':user.location.postcode,'cell':user.cell };
  generated_user=Generate_User.fromMap(e);
  notifyListeners();
  }
}