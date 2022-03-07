// import 'dart:convert';

// class Models {
//   String? uesrName;
//   int? age;
//   String? email;
//   String? password;
//   String? confimPassword;

//   // Models();

//   Map<String, dynamic> toMap() {
//     return {
//       'uesrName': uesrName,
//       'age': age,
//       'email': email,
//       'password': password,
//       'confim_password': confimPassword,
//     };
//   }

//   factory Models.fromMap(Map<String, dynamic> map) {
//     return Models(
//       uesrName: map['uesrName'] ?? '',
//       age: map['age']?.toInt() ?? 0,
//       email: map['email'] ?? '',
//       password: map['password'] ?? '',
//       confimPassword: map['confimPassword'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Models.fromJson(String source) => Models.fromMap(json.decode(source));
// }
