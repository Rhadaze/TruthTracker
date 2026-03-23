enum VenueType {
  church,
  auditorium,
  school,
  university,
  house,
  publicSpace,
  other,
}

extension VenueTypeX on VenueType {
  String get label => switch (this) {
    VenueType.church => 'Church',
    VenueType.auditorium => 'Auditorium',
    VenueType.school => 'School',
    VenueType.university => 'University',
    VenueType.house => 'House',
    VenueType.publicSpace => 'Public space',
    VenueType.other => 'Other',
  };
}
