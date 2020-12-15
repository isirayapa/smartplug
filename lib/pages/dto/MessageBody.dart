class MessageBody {
  final String clientRef;
  final String number;
  final String text;
  final String campaignName;

  MessageBody(this.clientRef, this.number, this.text, this.campaignName);

  MessageBody.fromJson(Map<String, dynamic> json)
      : clientRef = json['clientRef'],
        number = json['number'],
        text = json['text'],
        campaignName = json['campaignName'];

  Map<String, dynamic> toJson() => {
        'clientRef': clientRef,
        'number': number,
        'text': text,
        'campaignName': campaignName,
      };
}
