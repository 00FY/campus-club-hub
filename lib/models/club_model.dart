class ClubModel {
  final String id;
  final String name;
  final String domain;
  final bool isActive;
  final int memberCount;
  final int eventCount;

  const ClubModel({
    required this.id,
    required this.name,
    required this.domain,
    required this.isActive,
    this.memberCount = 0,
    this.eventCount = 0,
  });

  String getStatus() {
    if (isActive) {
      return '$name is currently active';
    } else {
      return '$name is inactive';
    }
  }

  @override
  String toString() {
    return 'Club: $name | Domain: $domain | Active: $isActive';
  }
}