import 'MessageBody.dart';

class TextMessage {
  final List<MessageBody> messages;

  TextMessage(this.messages);

  TextMessage.fromJson(Map<String, dynamic> json)
      : messages = json['messages'] != null
            ? List<MessageBody>.from(json['message'])
            : null;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'messages': messages,
      };
}
