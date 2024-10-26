List<Language> langList = [
  Khmer(),
  Language(),
];
class Language{
  String get hello => "Hello";
  String get welcome => "Welcome"; 
  String get goodbye => "Goodbye"; 
}
class Khmer implements Language{
  String get hello => "សួស្ដី";
  String get welcome => "សូមស្វាគមន៍"; 
  String get goodbye => "លាហើយ";
}