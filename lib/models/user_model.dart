import 'dart:convert';

class UserModel {
  String? uid;
  String? name;
  String? email;
  UserModel({
    this.uid,
    this.name,
    this.email,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        email: json['email'],
        uid: json['uid'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid': uid,
      };

  @override
  String toString() => 'UserModel(uid: $uid, name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ email.hashCode;
}
