// Pure Dart class — no Flutter, no Firebase needed
class ClubModel {
  final String id;
  final String name;
  final String domain;
  final bool isActive;

  // Constructor
  const ClubModel({
    required this.id,
    required this.name,
    required this.domain,
    required this.isActive,
  });

  // Dart basics: functions
  String getStatus() {
    if (isActive) {
      return '$name is currently active';
    } else {
      return '$name is inactive';
    }
  }

  // toString so you can print the object
  @override
  String toString() {
    return 'Club: $name | Domain: $domain | Active: $isActive';
  }
}