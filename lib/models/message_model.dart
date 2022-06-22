import 'dart:convert';

class MessageModel {
  String? message;
  String? fromMessage;
  String? toMessage;
  DateTime? createdAt;
  MessageModel({
    this.message,
    this.fromMessage,
    this.toMessage,
    this.createdAt,
  });

  MessageModel copyWith({
    String? message,
    String? fromMessage,
    String? toMessage,
    DateTime? createdAt,
  }) {
    return MessageModel(
      message: message ?? this.message,
      fromMessage: fromMessage ?? this.fromMessage,
      toMessage: toMessage ?? this.toMessage,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'fromMessage': fromMessage,
      'toMessage': toMessage,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'],
      fromMessage: map['fromMessage'],
      toMessage: map['toMessage'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageModel(message: $message, fromMessage: $fromMessage, toMessage: $toMessage, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.message == message &&
        other.fromMessage == fromMessage &&
        other.toMessage == toMessage &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        fromMessage.hashCode ^
        toMessage.hashCode ^
        createdAt.hashCode;
  }
}
