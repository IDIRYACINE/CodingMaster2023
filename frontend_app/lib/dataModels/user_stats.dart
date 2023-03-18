class UserStats {
  final String? userId;
  final int? vehiculeMatricule;
  final bool authorised;
  final String? name;
  final DateTime date;

  UserStats(
      {required this.date,
      this.userId,
      this.vehiculeMatricule,
      required this.authorised,
      this.name});
}
