// class User {
//   String idObject;
//   String name;
//   String email;
//   String password;

//   User({
//     required this.idObject,
//     required this.name,
//     required this.email,
//     required this.password,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       idObject: json['idObject'],
//       name: json['name'],
//       email: json['email'],
//       password: json['password'],
//     );
//   }

//   get profileImage => null;

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'email': email,
//       'password': password,
//     };
//   }
// }

class User {
  String idObject;
  String name;
  String email;
  String password;
  String profileImageUrl;

  User({
    required this.idObject,
    required this.name,
    required this.email,
    required this.password,
    required this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idObject: json['idObject'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idObject': idObject,
      'name': name,
      'email': email,
      'password': password,
      'profileImageUrl': profileImageUrl,
    };
  }
}
