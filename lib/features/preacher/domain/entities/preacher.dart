class Preacher {
  final int? id;
  final String name;
  final String? email;
  final String? phone;
  final String? languages;
  final String? denomination;

  Preacher({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.languages,
    this.denomination,
  });
}
