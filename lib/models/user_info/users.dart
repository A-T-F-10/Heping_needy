class Users{
  String? email;
  String? password;

  Users({this.email,this.password});
  Users.fromJson(Map<String,dynamic> json){
    email=json['email'];
    password=json['password'];

  }
  Map toMop(){

    return{'email':email,'password':password };
  }



}