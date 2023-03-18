class User {
  final String name;
  final String id;
  final DateTime startValidity;
  final DateTime endValidity;
  final UserTypes userType;

  User(
      {required this.name,
      required this.id,
      required this.startValidity,
      required this.endValidity,
      required this.userType});
}

enum UserTypes { admin, student, employee, temporaryUser, agent }
