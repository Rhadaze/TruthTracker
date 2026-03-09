class Venue {
  final int id;
  final String name;
  final String country;
  final String state;
  final String city;
  final String? neighborhood;
  final String denomination;

  Venue({
    required this.id,
    required this.name,
    required this.country,
    required this.state,
    required this.city,
    this.neighborhood,
    required this.denomination,
  });
}
