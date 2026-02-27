enum EventTypeVisit {
  astray,
  sickness,
  routine,
  counseling,
  mourning;

  String get label => switch (this) {
    EventTypeVisit.routine => "Rotina",
    EventTypeVisit.counseling => "Aconselhamento",
    EventTypeVisit.astray => "Afastado",
    EventTypeVisit.sickness => "Doença",
    EventTypeVisit.mourning => "Luto",
  };
}
