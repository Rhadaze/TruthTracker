enum EventTypeTeaching {
  churchClass,
  bibleStudy,
  university;

  String get label => switch (this) {
    EventTypeTeaching.bibleStudy => "Estudo bíblico",
    EventTypeTeaching.churchClass => "Classe bíblica",
    EventTypeTeaching.university => "Universidade",
  };
}
