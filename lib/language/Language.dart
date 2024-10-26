List<Language> langList = [
  Khmer(),
  Language(),
];
class Language{
  String get hello => "Hello";
}
class Khmer implements Language{
  String get hello => "សួស្ដី";
}

