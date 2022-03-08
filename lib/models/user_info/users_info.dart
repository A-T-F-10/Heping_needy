import 'package:holping_needy_project/models/user_info/users.dart';

class UsersInfo{
  Users? users;

  UsersInfo({this.users});
  UsersInfo.fromJson(Map<String,dynamic> json){
    users=json['users'];

  }
  Map toMop(){

    return{'users':users };
  }



}