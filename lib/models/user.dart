class UserModel {
  final String uid;
  final String? email;
  final bool isGuest;

  UserModel({
    required this.uid,
    this.email,
    required this.isGuest,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email ?? "guest",
      "isGuest": isGuest,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map["uid"],
      email: map["email"],
      isGuest: map["isGuest"] ?? false,
    );
  }
}
