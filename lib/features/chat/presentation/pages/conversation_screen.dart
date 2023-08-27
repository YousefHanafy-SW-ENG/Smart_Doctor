// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:doctor_final/core/uitls/app_colors.dart';
// import 'package:doctor_final/core/uitls/image_manager.dart';
// import 'package:doctor_final/features/chat/data/models/current_user_info.dart';
// import 'package:doctor_final/features/chat/data/models/message_model.dart';
// import 'package:doctor_final/features/chat/data/models/reciver_user_info.dart';
// import 'package:doctor_final/features/chat/presentation/cubit/chat_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:sizer/sizer.dart';

// class ConversationChatScreen extends StatelessWidget {
//   ConversationChatScreen({Key? key}) : super(key: key);
//   TextEditingController textController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Builder(builder: (context) {
//       ChatCubit().getCubit(context).getMessages(reciverId: ReciverUserInfo.uId);

//       return BlocConsumer<ChatCubit, ChatStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           ChatCubit myCubit = ChatCubit().getCubit(context);

//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   myCubit.clearDocsHasTheSameName();
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back_ios_new,
//                   color: Colors.black,
//                 ),
//               ),
//               elevation: 0,
//               backgroundColor: Colors.white,
//               title: Text(
//                 "${ReciverUserInfo.userName}(${ReciverUserInfo.typeName})",
//                 style: const TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: ConditionalBuilder(
//                     condition: myCubit.messages.isNotEmpty,
//                     builder: (BuildContext context) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ListView.separated(
//                           itemBuilder: (context, index) {
//                             if (CurrentUserInfo.uId ==
//                                 myCubit.messages[index].senderId) {
//                               return Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Expanded(
//                                     child: buildMyMessage(
//                                       myCubit.messages[index],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 0.7.w,
//                                   ),
//                                   if (index == 0)
//                                     CircleAvatar(
//                                       backgroundColor: AppColors.blue,
//                                       radius: 2.7.h,
//                                       child: CircleAvatar(
//                                         foregroundImage: NetworkImage(
//                                             ImageManager.personImageUrl),
//                                         radius: 2.6.h,
//                                       ),
//                                     ),
//                                   if (index > 0)
//                                     if (myCubit.messages[index].reciverId !=
//                                             myCubit.messages[index - 1]
//                                                 .reciverId &&
//                                         myCubit.messages[index].chatVoice == '')
//                                       CircleAvatar(
//                                         backgroundColor: AppColors.blue,
//                                         radius: 2.7.h,
//                                         child: CircleAvatar(
//                                           foregroundImage: NetworkImage(
//                                               ImageManager.personImageUrl),
//                                           radius: 2.6.h,
//                                         ),
//                                       ),
//                                 ],
//                               );
//                             }

//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 if (index == 0)
//                                   CircleAvatar(
//                                     backgroundColor: AppColors.blue,
//                                     radius: 2.7.h,
//                                     child: CircleAvatar(
//                                       foregroundImage: NetworkImage(
//                                           ImageManager.personImageUrl),
//                                       radius: 2.6.h,
//                                     ),
//                                   ),
//                                 if (index > 0)
//                                   if (myCubit.messages[index].reciverId !=
//                                           myCubit
//                                               .messages[index - 1].reciverId &&
//                                       myCubit.messages[index].chatVoice == '')
//                                     CircleAvatar(
//                                       backgroundColor: AppColors.blue,
//                                       radius: 2.7.h,
//                                       child: CircleAvatar(
//                                         foregroundImage: NetworkImage(
//                                             ImageManager.personImageUrl),
//                                         radius: 2.6.h,
//                                       ),
//                                     ),
//                                 SizedBox(
//                                   width: 0.7.w,
//                                 ),
//                                 Expanded(
//                                   child: buildMessage(
//                                     myCubit.messages[index],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                           separatorBuilder: (context, index) => const SizedBox(
//                             height: 10,
//                           ),
//                           itemCount: myCubit.messages.length,
//                         ),
//                       );
//                     },
//                     fallback: (context) => const SizedBox(),
//                   ),
//                 ),
//                 if (myCubit.chatImage != null)
//                   Container(
//                     height: 15.h,
//                     width: 80.w,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: Image.file(myCubit.chatImage!).image),
//                     ),
//                     child: Align(
//                       alignment: AlignmentDirectional.bottomEnd,
//                       child: TextButton(
//                         onPressed: () {
//                           myCubit.chatImage = null;
//                           myCubit.emit(CancleChatImageState());
//                         },
//                         child: const Text('Cancel'),
//                       ),
//                     ),
//                   ),
//                 !myCubit.showTextFormField
//                     ? TextButton(
//                         onPressed: () {
//                           myCubit.showAndHideTextFormField();
//                         },
//                         child: const Text('Purchase a new Session'),
//                       )
//                     : Row(
//                         children: [
//                           SizedBox(
//                             width: 1.w,
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               ChatCubit().getCubit(context).pickChatImage();
//                             },
//                             icon: Icon(
//                               Icons.camera_alt_outlined,
//                               color: AppColors.blue,
//                               size: 8.5.w,
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               margin: const EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                 color: AppColors.white,
//                                 border: Border.all(
//                                   color: AppColors.blue,
//                                   width: 2,
//                                 ),
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                               height: 7.7.h,
//                               child: Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.emoji_emotions_outlined,
//                                       color: AppColors.blue,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: TextField(
//                                       onSubmitted: (v) {
//                                         if (textController.text != '' ||
//                                             myCubit.chatImageUrl != '') {
//                                           ChatCubit()
//                                               .getCubit(context)
//                                               .sendMessage(
//                                                 reciverId: ReciverUserInfo.uId,
//                                                 text: textController.text,
//                                                 time: DateTime.now(),
//                                                 image: myCubit.chatImageUrl,
//                                               );
//                                         }
//                                         myCubit.chatImage = null;
//                                         textController.text = '';
//                                         myCubit.chatImageUrl = '';
//                                       },
//                                       controller: textController,
//                                       cursorColor: Colors.white,
//                                       decoration: const InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: 'write your massage here',
//                                         hintStyle:
//                                             TextStyle(color: Colors.white),
//                                         contentPadding: EdgeInsets.all(
//                                           20,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () async {
//                                       await myCubit.startAndEndRecording();
//                                     },
//                                     child: Icon(
//                                       myCubit.buttonIcon,
//                                       size: 4.h,
//                                       color: myCubit.buttonColor,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {
//                                       if (textController.text != '' ||
//                                           myCubit.chatImageUrl != '') {
//                                         ChatCubit()
//                                             .getCubit(context)
//                                             .sendMessage(
//                                               reciverId: ReciverUserInfo.uId,
//                                               text: textController.text,
//                                               time: DateTime.now(),
//                                               image: myCubit.chatImageUrl,
//                                             );
//                                       }
//                                       myCubit.chatImage = null;
//                                       textController.text = '';
//                                       myCubit.chatImageUrl = '';
//                                     },
//                                     icon: Icon(
//                                       Icons.send,
//                                       color: AppColors.blue,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//               ],
//             ),
//           );
//         },
//       );
//     });
//   }
// }

// Widget buildMessage(MessageModel messageModel) {
//   final player = AudioPlayer();
//   return Align(
//     alignment: AlignmentDirectional.centerStart,
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadiusDirectional.only(
//           topEnd: Radius.circular(15.0),
//           topStart: Radius.circular(15.0),
//           bottomEnd: Radius.circular(15.0),
//         ),
//         color: Colors.grey[350],
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10.0,
//         vertical: 10.0,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (messageModel.chatVoice != '')
//             Container(
//               height: 8.h,
//               width: 50.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: AppColors.white,
//               ),
//               child: IconButton(
//                 onPressed: () async {
//                   final duration = await player.setUrl(
//                     messageModel.chatVoice.toString(),
//                   );
//                   player.play();
//                 },
//                 icon: Row(
//                   children: [
//                     const Icon(Icons.play_arrow),
//                     const Spacer(),
//                     CircleAvatar(
//                       backgroundColor: AppColors.blue,
//                       radius: 2.7.h,
//                       child: CircleAvatar(
//                         foregroundImage:
//                             NetworkImage(ImageManager.personImageUrl),
//                         radius: 2.6.h,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           Text(
//             messageModel.text,
//             style: TextStyle(
//               fontSize: 14.sp,
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           if (messageModel.pickedFileUrl != '')
//             SizedBox(
//               height: 40.h,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Image.network(
//                   messageModel.pickedFileUrl.toString(),
//                 ),
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.only(top: 4.0),
//             child: Text(
//               DateFormat('h:m:a')
//                   .format(DateTime.parse(messageModel.time.toDate().toString()))
//                   .toString(),
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 7.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget buildMyMessage(MessageModel messageModel) {
//   final player = AudioPlayer();

//   return Align(
//     alignment: AlignmentDirectional.centerEnd,
//     child: Container(
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadiusDirectional.only(
//           topEnd: Radius.circular(15.0),
//           topStart: Radius.circular(15.0),
//           bottomStart: Radius.circular(15.0),
//         ),
//         color: Colors.blue,
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10.0,
//         vertical: 10.0,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           if (messageModel.chatVoice != '')
//             Container(
//               height: 8.h,
//               width: 50.w,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: AppColors.white,
//               ),
//               child: IconButton(
//                 onPressed: () async {
//                   final duration = await player.setUrl(
//                     messageModel.chatVoice.toString(),
//                   );
//                   player.play();
//                 },
//                 icon: Row(
//                   children: [
//                     const Icon(Icons.play_arrow),
//                     const Spacer(),
//                     CircleAvatar(
//                       backgroundColor: AppColors.blue,
//                       radius: 2.7.h,
//                       child: CircleAvatar(
//                         foregroundImage:
//                             NetworkImage(ImageManager.personImageUrl),
//                         radius: 2.6.h,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           Text(
//             messageModel.text,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           if (messageModel.pickedFileUrl != '')
//             SizedBox(
//               height: 50.h,
//               width: 70.w,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Image.network(
//                   messageModel.pickedFileUrl.toString(),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           Padding(
//             padding: messageModel.chatVoice == ''
//                 ? const EdgeInsets.all(0)
//                 : const EdgeInsets.only(top: 4.0),
//             child: Text(
//               DateFormat('h:m:a')
//                   .format(DateTime.parse(messageModel.time.toDate().toString()))
//                   .toString(),
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 7.sp,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
