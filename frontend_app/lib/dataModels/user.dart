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

  copyWith({
    String? name,
    String? id,
    DateTime? startValidity,
    DateTime? endValidity,
    UserTypes? userType,
  }) {
    return User(
      name: name ?? this.name,
      id: id ?? this.id,
      startValidity: startValidity ?? this.startValidity,
      endValidity: endValidity ?? this.endValidity,
      userType: userType ?? this.userType,
    );
  }

  factory User.initial() => User(
      name: '',
      id: '',
      startValidity: DateTime.now(),
      endValidity: DateTime.now(),
      userType: UserTypes.student);
}

enum UserTypes { admin, student, employee, temporaryUser, agent }
