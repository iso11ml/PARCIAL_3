// class User {
//   String idObject;
//   String name;
//   String email;
//   String password;
//   String profileImageUrl;

//   User({
//     required this.idObject,
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.profileImageUrl,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       idObject: json['idObject'],
//       name: json['name'],
//       email: json['email'],
//       password: json['password'],
//       profileImageUrl: json['profileImageUrl'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'idObject': idObject,
//       'name': name,
//       'email': email,
//       'password': password,
//       'profileImageUrl': profileImageUrl,
//     };
//   }
// }
class User {
  final String idObject;
  final String name;
  final String email;
  final String password;
  final String? profileImageUrl; // Hacer el campo opcional

  User({
    required this.idObject,
    required this.name,
    required this.email,
    required this.password,
    this.profileImageUrl = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idObject: json['_id'] != null ? json['_id'].toString() : '',
      name: json['name'],
      email: json['email'],
      password: json['password'],
      profileImageUrl: json['profileImageUrl']
          as String?, // or json['profileImageUrl'] ?? ''
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
