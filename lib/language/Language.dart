List<Language> langList = [
  Khmer(),
  Language(),
];
class Language{
  String get browse => "Hompage";
  String get search => "Search"; 
  String get aboutus => "About Us"; 
}
class Khmer implements Language{
  String get browse => "ទំព័រដើម";
  String get search => "ស្វែងរក"; 
  String get aboutus => "អំពីយើង"; 
}