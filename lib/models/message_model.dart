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

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        fromMessage: json['fromMessage'],
        toMessage: json['toMessage'],
        message: json['message'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'fromMessage': fromMessage,
        'toMessage': toMessage,
        'message': message,
        'createdAt': createdAt!.toIso8601String(),
      };

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
