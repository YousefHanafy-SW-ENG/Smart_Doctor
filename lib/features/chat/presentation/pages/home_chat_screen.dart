// import 'package:doctor_final/config/routes/app_routes.dart';
// import 'package:doctor_final/features/chat/data/models/current_user_info.dart';
// import 'package:doctor_final/features/chat/presentation/cubit/chat_cubit.dart';
// import 'package:doctor_final/features/home/presentation/widgets/my_app_bar.dart';
// import 'package:doctor_final/features/login/presentation/screens/login_screen.dart';
// import 'package:doctor_final/features/login/presentation/widgets/seperator_sized_box.dart';
// import 'package:doctor_final/features/show_result/presentation/widgets/show_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../widgets/my_button.dart';

// class HomeChatScreen extends StatelessWidget {
//   final registrationKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController typeNameController = TextEditingController();

//   HomeChatScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ChatCubit, ChatStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           appBar: myAppBar(
//               appTitle: const Text('Create Chat'),
//               centerTitle: true,
//               hasBackArrow: true,
//               context: context),
//           body: Form(
//             key: registrationKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'please enter this data before chating',
//                   ),
//                   const Seperator(),
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       icon: Icon(Icons.person),
//                       labelText: 'Name ',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'enter valid name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: typeNameController,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       icon: Icon(Icons.person),
//                       labelText: 'Type Name ',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'enter valid type';
//                       }
//                       return null;
//                     },
//                   ),
//                   const Seperator(),
//                   MyButton(
//                     press: () {
//                       if (registrationKey.currentState!.validate()) {
//                         ChatCubit().getCubit(context).uploadUserInfo(
//                               name: nameController.text,
//                               typeName: typeNameController.text,
//                             );
//                         Navigator.pushNamed(
//                           context,
//                           Routes.searchChatScreen,
//                         );
//                       }
//                     },
//                     text: 'Create New Chat',
//                     color: Colors.blue,
//                   ),
//                   const Seperator(),
//                   MyButton(
//                     press: () {
//                       if (CurrentUserInfo.name != '' &&
//                           CurrentUserInfo.typeName != '' &&
//                           CurrentUserInfo.uId != '') {
//                         Navigator.pushNamed(
//                           context,
//                           Routes.searchChatScreen,
//                         );
//                       } else {
//                         showToast(
//                             text: 'you must enter your data at this time');
//                       }
//                     },
//                     text: 'Use My Data',
//                     color: Colors.blue,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
