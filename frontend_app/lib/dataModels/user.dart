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

enum UserFields { name, id, startValidity, endValidity, userType }

User? userFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return null;
  }

  final rawStart = json[UserFields.startValidity.name] as String?;
  final rawEnd = json[UserFields.endValidity.name] as String?;

  final startValidity = rawStart == null
      ? DateTime.now()
      : DateTime.tryParse(rawStart) ?? DateTime.now();

  final endValidity = rawEnd == null
      ? DateTime.now()
      : DateTime.tryParse(rawEnd) ?? DateTime.now();

  return User(
    name: json[UserFields.name.name] as String,
    id: json[UserFields.id.name] as String,
    startValidity: startValidity,
    endValidity: endValidity,
    userType: _userTypeFromString(json["user_type"][UserFields.name.name]),
  );
}

List<User> userListFromJson(List<dynamic> json) {
  final List<User> users = [];

  for (var e in json) {
    final user = userFromJson(e as Map<String, dynamic>);
    if (user != null) {
      users.add(user);
    }
  }

  return users;
}

UserTypes _userTypeFromString(String data) {
  switch (data) {
    case "agent":
      return UserTypes.agent;
    case "admin":
      return UserTypes.admin;
    default:
      return UserTypes.employee;
  }
}
