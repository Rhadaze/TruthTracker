class Preacher {
  final int? id;
  final String name;
  final String? email;
  final String? phone;
  final List<String> languages;
  final String? denomination;
  final String? notes;
  final int? homeVenueId;

  const Preacher({
    this.id,
    required this.name,
    this.email,
    this.phone,
    this.languages = const [],
    this.denomination,
    this.notes,
    this.homeVenueId,
  });
}
