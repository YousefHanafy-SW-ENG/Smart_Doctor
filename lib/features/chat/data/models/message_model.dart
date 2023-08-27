// class MessageModel {
//   String? senderId;
//   String? reciverId;
//   var time;
//   String text = '';
//   String? pickedFileUrl;
//   String? chatVoice;

//   MessageModel({
//     this.senderId,
//     this.reciverId,
//     this.time,
//     required this.text,
//     this.pickedFileUrl = '',
//     this.chatVoice = '',
//   });
//   MessageModel.fromJson(Map<String, dynamic>? json) {
//     {
//       reciverId = json!['reciverId'];
//       senderId = json['senderId'];
//       time = json['time'];
//       text = json['text'];
//       pickedFileUrl = json['pickedFileUrl'];
//       chatVoice = json['chatVoice'];
//     }
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'reciverId': reciverId,
//       'senderId': senderId,
//       'time': time,
//       'text': text,
//       'pickedFileUrl': pickedFileUrl,
//       'chatVoice': chatVoice,
//     };
//   }
// }
