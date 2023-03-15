class User{
  final String id;
  final String name;
  final UserType type;

  User(this.id, this.name, this.type);

}

enum UserType{
  admin,
  student,
  agent,
  employee,
}