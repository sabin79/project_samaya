// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String fullname;
  final String email;
  final String password;
  UserModel({
    required this.fullname,
    required this.email,
    required this.password,
  });
  tojson() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
    };
  }
}
