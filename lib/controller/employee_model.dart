// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmployeeModel {
  final String? id;
  final String fullname;
  final String email;
  final String password;
  List department;
  EmployeeModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
    required this.department,
  });
  tojson() {
    return {
      'fullname': fullname,
      'email': email,
      'password': password,
      'department': department
    };
  }
}
