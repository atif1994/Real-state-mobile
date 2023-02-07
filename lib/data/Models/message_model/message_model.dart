class MessageModel {
  final int? messageId;
  final String? message;
  final int? senderId;
  final int? receiverId;
  final String? image;
  //final MyDateTime myDateTime;
  final bool? isTimeFromServer;

  MessageModel(
      {this.messageId,
      this.message,
      this.senderId,
      this.receiverId,
      this.image,
      // required this.myDateTime,
      this.isTimeFromServer});
}
