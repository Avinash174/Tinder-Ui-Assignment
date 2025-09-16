class Profile {
  final String id;
  final String name;
  final int age;
  final String photoUrl;
  final String location;

  Profile({
    required this.id,
    required this.name,
    required this.age,
    required this.photoUrl,
    required this.location,
  });

  /// Convert Firestore map → Profile object
  factory Profile.fromMap(String id, Map<String, dynamic> data) {
    return Profile(
      id: id,
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
      photoUrl: data['photoUrl'] ?? '',
      location: data['location'] ?? '',
    );
  }

  /// Convert Profile object → Firestore map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'photoUrl': photoUrl,
      'location': location,
    };
  }
}
