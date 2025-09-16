// lib/models/auth_user.dart
class AuthUser {
  final String uid;
  final String? email;
  final bool isGuest;

  AuthUser({
    required this.uid,
    this.email,
    this.isGuest = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email ?? 'guest',
      'isGuest': isGuest,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      uid: map['uid'] as String,
      email: map['email'] as String?,
      isGuest: map['isGuest'] as bool? ?? false,
    );
  }
}
