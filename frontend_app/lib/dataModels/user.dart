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

enum UserFields { name, id, startValidity, endValidity, userType , qrUserId,qrUserName}

extension _UserFields on UserFields{
  String get name {
    switch (this) {
      case UserFields.name:
        return "name";
      case UserFields.id:
        return "id";
      case UserFields.startValidity:
        return "startValidity";
      case UserFields.endValidity:
        return "endValidity";
      case UserFields.userType:
        return "user_type";
      case UserFields.qrUserId:
        return "user_id";
      case UserFields.qrUserName:
        return "identifier";
    }
  }
}

User? userFromJson(Map<String, dynamic>? json ,[bool isQr = false]) {
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

  final userKey = isQr ? UserFields.qrUserName : UserFields.name;
  final userIdKey = isQr ? UserFields.qrUserId : UserFields.id;

  String userType = json["Users"][0][UserFields.userType.name][UserFields.name.name];

  return User(
    name: json[userKey.name] as String,
    id: json[userIdKey.name] as String,
    startValidity: startValidity,
    endValidity: endValidity,
    userType: _userTypeFromString(userType),
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
