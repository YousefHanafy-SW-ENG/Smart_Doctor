 

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:doctor_final/core/shared_pref/cash_helper.dart';
// import 'package:doctor_final/core/uitls/app_colors.dart';
// import 'package:doctor_final/features/chat/data/models/current_user_info.dart';
// import 'package:doctor_final/features/chat/data/models/message_model.dart';
// import 'package:doctor_final/features/chat/data/models/reciver_user_info.dart';
// import 'package:doctor_final/features/chat/presentation/widgets/show_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'dart:async';
// import 'dart:io' as io;

// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// part 'chat_state.dart';

// class ChatCubit extends Cubit<ChatStates> {
//   ChatCubit() : super(ChatInitialState());

//   ChatCubit getCubit(context) => BlocProvider.of(context);
//   bool searchBarVisibale = false;
//   String returnedUserName = '';
//   String returnedUserEmail = '';
//   FlutterAudioRecorder2? _recorder;
//   Duration? recordDuration;
//   Recording? _current;
//   String? recordPath;
//   File? recordedFile;

//   RecordingStatus _currentStatus = RecordingStatus.Unset;
//   void toggleSearchBarVisibility() {
//     searchBarVisibale = !searchBarVisibale;
//     emit(ToggleSearchBarState());
//   }

//   void uploadUserInfo({
//     required String name,
//     required String typeName,
//   }) {
//     emit(UploadUserDataLoading());
//     final docUser = FirebaseFirestore.instance.collection('users').doc();
//     docUser.set(
//       {
//         'name': name,
//         'typeName': typeName,
//         'typeId': 'passport',
//         'uId': docUser.id,
//       },
//     ).then((value) {
//       CurrentUserInfo.uId = docUser.id;
//       CurrentUserInfo.name = name;
//       CurrentUserInfo.typeName = typeName;
//       CashHelper.saveData(key: 'uId', value: docUser.id);
//       CashHelper.saveData(key: 'name', value: name);
//       CashHelper.saveData(key: 'typeName', value: typeName);
//       emit(UploadUserDataSucess());
//     });
//   }

//   List<QueryDocumentSnapshot<Map<String, dynamic>>> docsHasTheSameName = [];
//   void getUserByName({required String name}) async {
//     emit(GetUsersByNameLoadingState());
//     FirebaseFirestore.instance
//         .collection('users')
//         .where('name', isEqualTo: name)
//         .get()
//         .then((value) {
//       docsHasTheSameName = value.docs;

//       emit(GetUserByNameSucessState());
//     }).catchError((e) {
//       emit(GetUserByNameFailState());
//       debugPrint(e.toString());
//     });
//   }

//   void sendMessage({
//     required reciverId,
//     required text,
//     required time,
//     required image,
//   }) {
//     MessageModel messageModel = MessageModel(
//       senderId: CurrentUserInfo.uId,
//       reciverId: reciverId,
//       text: text,
//       time: time,
//       pickedFileUrl: image,
//       chatVoice: chatVoiceUrl,
//     );
//     chatVoiceUrl = '';

//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(CurrentUserInfo.uId)
//         .collection('chats')
//         .doc(reciverId)
//         .collection('messages')
//         .doc()
//         .set(messageModel.toMap())
//         .then((value) {
//       emit(MessageSentSuccessState());
//     }).catchError((e) {
//       debugPrint(e.toString());
//       emit(MessageSentFailState());
//     });
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(reciverId)
//         .collection('chats')
//         .doc(CurrentUserInfo.uId)
//         .collection('messages')
//         .doc()
//         .set(messageModel.toMap())
//         .then((value) {
//       emit(ReciverMessageSentSuccessState());
//     }).catchError((e) {
//       debugPrint(e.toString());
//       emit(ReciverMessageSentFailState());
//     });
//   }

//   List<MessageModel> messages = [];
//   void getMessages({
//     required String reciverId,
//   }) {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(CurrentUserInfo.uId)
//         .collection('chats')
//         .doc(reciverId)
//         .collection('messages')
//         .orderBy('time')
//         .snapshots()
//         .listen((event) {
//       emit(GetMessagesSuccessState());
//       messages = [];
//       event.docs.forEach((element) {
//         messages.add(MessageModel.fromJson(element.data()));
//       });
//     });
//   }

//   void clearDocsHasTheSameName() {
//     docsHasTheSameName = [];
//     emit(ClearDocsHasTheSameNameState());
//   }

//   init() async {
//     try {
//       emit(RecorderInitializationLoadingfulState());
//       await Permission.microphone.request();
//       bool hasPermission = await FlutterAudioRecorder2.hasPermissions ?? false;
//       print("$hasPermission permission is ");
//       if (hasPermission) {
//         String customPath = '/fFilePickerResultlutter_audio_recorder_';
//         io.Directory appDocDirectory;
//         if (io.Platform.isIOS) {
//           appDocDirectory = await getApplicationDocumentsDirectory();
//         } else {
//           appDocDirectory = (await getExternalStorageDirectory())!;
//         }

//         customPath = appDocDirectory.path +
//             customPath +
//             DateTime.now().millisecondsSinceEpoch.toString();
//         _recorder =
//             FlutterAudioRecorder2(customPath, audioFormat: AudioFormat.WAV);

//         await _recorder!.initialized;
//         var current = await _recorder!.current(channel: 0);

//         _current = current;
//         _currentStatus = current!.status!;
//         emit(RecorderInitializedSuccessfulState());
//       } else {
//         showToast(text: "You must accept permissions");
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   start() async {
//     // if (_current!.status != RecordingStatus.Initialized) {
//     //   await init();
//     // }
//     await init();
//     try {
//       await _recorder!.start();
//       var recording = await _recorder!.current(channel: 0);

//       _current = recording;
//       emit(RecordingNowState());

//       const tick = Duration(milliseconds: 50);
//       Timer.periodic(tick, (Timer t) async {
//         if (_currentStatus == RecordingStatus.Stopped) {
//           t.cancel();
//         }

//         var current = await _recorder!.current(channel: 0);

//         _current = current;
//         _currentStatus = _current!.status!;
//         recordDuration = _current!.duration;

//         emit(EndRecordingState());
//       });
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   stop() async {
//     var result = await _recorder!.stop();
//     // recordDuration = result!.duration;
//     recordPath = result!.path;
//     recordedFile = File('${result.path}');
//     _current = result;
//     _currentStatus = _current!.status!;
//     uploadChatVoice().then((value) {
//       sendMessage(
//         reciverId: ReciverUserInfo.uId,
//         text: '',
//         time: DateTime.now(),
//         image: '',
//       );
//       chatVoiceUrl = '';
//     });

//     emit(StopRecordingState());
//   }

//   bool isRecording = false;
//   IconData buttonIcon = Icons.mic;
//   Color buttonColor = AppColors.blue;
//   Future<void> startAndEndRecording() async {
//     if (!isRecording) {
//       // isConditionVoiceUploaded = false;
//       isRecording = true;
//       buttonIcon = Icons.stop;
//       buttonColor = Colors.red;
//       start();
//       showToast(text: 'Start Recording');

//       emit(StartRecordingState());
//     } else {
//       isRecording = false;
//       buttonIcon = Icons.mic;
//       buttonColor = Colors.blue;
//       stop();

//       emit(StopRecordingState());
//     }
//   }

//   // File? pickedFile;
//   // String pickedFileUrl = '';
//   // void pickFile() async {
//   //   FilePickerResult? result = await FilePicker.platform.pickFiles();
//   //   Permission.storage.request();
//   //   if (result != null) {
//   //     pickedFile = File(result.files.single.path!);
//   //     emit(PickFileSuccessState());
//   //     print(pickedFile);
//   //   } else {
//   //     // User canceled the picker
//   //   }
//   // }

//   // Future uploadPickedFile() async {
//   //   emit(UploadingImageState());
//   //   FirebaseStorage storage = FirebaseStorage.instance;
//   //   Reference ref = storage.ref().child(DateTime.now().toString());
//   //   await ref.putFile(File(pickedFile!.path));
//   //   pickedFileUrl = await ref.getDownloadURL();
//   // }\

//   // void uploadImageToCloud(){
//   //   emit(UploadingImageState());

//   // }
//   var picker = ImagePicker();
//   File? chatImage;
//   String chatImageUrl = '';

//   Future<void> pickChatImage() async {
//     try {
//       var image = await picker.pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       var imageTemporery = File(image.path);
//       chatImage = imageTemporery;
//       uploadChatImage();
//       emit(PickChatImageSuccessState());
//     } on Exception catch (e) {
//       emit(PickChatImageErrorState());
//     }
//   }

//   Future uploadChatImage() async {
//     emit(UploadingImageState());
//     FirebaseStorage storage = FirebaseStorage.instance;
//     Reference ref = storage.ref().child(DateTime.now().toString());
//     await ref.putFile(File(chatImage!.path));
//     chatImageUrl = await ref.getDownloadURL();
//   }

//   String chatVoiceUrl = '';

//   Future<void> uploadChatVoice() async {
//     emit(UploadChatVoiceLoadingState());
//     final ref = FirebaseStorage.instance.ref(DateTime.now().toString());
//     await ref.putFile(recordedFile!);
//     chatVoiceUrl = await ref.getDownloadURL();

//     emit(UploadChatVoiceSuccessState());
//     showToast(text: 'Record Uploded');
//   }

//   bool showTextFormField = false;
//   void showAndHideTextFormField() async {
//     showToast(text: 'You have only 15 secounds to chat with the doc');
//     showTextFormField = true;
//     emit(ToggleTextFieldVisiblility());
//     await Future.delayed(const Duration(seconds: 15));
//     showToast(text: 'Your time is up');
//     showTextFormField = false;
//     emit(ToggleTextFieldVisiblility());
//   }
// }
