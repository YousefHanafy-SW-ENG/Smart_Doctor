// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:doctor_final/config/routes/app_routes.dart';
// import 'package:doctor_final/core/uitls/app_colors.dart';
// import 'package:doctor_final/features/chat/data/models/current_user_info.dart';
// import 'package:doctor_final/features/chat/data/models/reciver_user_info.dart';
// import 'package:doctor_final/features/chat/presentation/pages/conversation_screen.dart';
// import 'package:doctor_final/features/chat/presentation/widgets/build_single_search_result.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../cubit/chat_cubit.dart';
// import '../widgets/show_toast.dart';

// class SearchChatScreen extends StatelessWidget {
//   SearchChatScreen({Key? key}) : super(key: key);
//   TextEditingController searchNameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     ChatCubit myCubit = ChatCubit().getCubit(context);

//     return BlocConsumer<ChatCubit, ChatStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//             backgroundColor: Color.fromARGB(239, 255, 255, 255),
//             drawer: Drawer(),
//             appBar: AppBar(
//               leading: IconButton(
//                 iconSize: 30,
//                 padding: const EdgeInsets.only(
//                   right: 10,
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back_ios,
//                   color: AppColors.darkBlack,
//                 ),
//               ),
//               title: Text('Welcome'),
//               centerTitle: true,
//               actions: [
//                 IconButton(
//                   iconSize: 30,
//                   padding: const EdgeInsets.only(
//                     right: 10,
//                   ),
//                   onPressed: () {
//                     myCubit.toggleSearchBarVisibility();
//                   },
//                   icon: Icon(
//                     Icons.search,
//                     color: AppColors.darkBlack,
//                   ),
//                 )
//               ],
//             ),
//             body: ConditionalBuilder(
//               condition: state is UploadUserDataLoading,
//               builder: (context) =>
//                   const Center(child: CircularProgressIndicator()),
//               fallback: (context) {
//                 return Column(
//                   children: [
//                     AnimatedOpacity(
//                       opacity: myCubit.searchBarVisibale ? 1.0 : 0.0,
//                       duration: const Duration(milliseconds: 500),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 55,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: TextField(
//                             style: const TextStyle(
//                               fontSize: 20,
//                               color: Colors.black,
//                             ),
//                             controller: searchNameController,
//                             decoration: const InputDecoration(
//                               contentPadding: EdgeInsets.all(20),
//                               hintText: 'search',
//                               border: InputBorder.none,
//                               hintStyle: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             onSubmitted: (v) {
//                               ChatCubit().getCubit(context).getUserByName(
//                                   name: searchNameController.text);
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: ConditionalBuilder(
//                         condition: state is GetUsersByNameLoadingState,
//                         builder: (context) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         },
//                         fallback: (BuildContext context) {
//                           return ListView.separated(
//                             shrinkWrap: true,
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () {
//                                   if (myCubit.docsHasTheSameName[index]
//                                           ['uId'] !=
//                                       CurrentUserInfo.uId) {
//                                     ReciverUserInfo.uId = myCubit
//                                         .docsHasTheSameName[index]['uId'];

//                                     ReciverUserInfo.userName = myCubit
//                                         .docsHasTheSameName[index]['name'];

//                                     ReciverUserInfo.typeName = myCubit
//                                         .docsHasTheSameName[index]['typeName'];
//                                     print(
//                                         "${myCubit.docsHasTheSameName[index]['uId']}><><><<<<<<<<<<<<<<<<<<<<<<<<<<");
//                                     searchNameController.text = '';
//                                     Navigator.pushNamed(
//                                       context,
//                                       Routes.conversationChatScreen,
//                                     );
//                                   } else {
//                                     showToast(
//                                         text:
//                                             'You Can\'t send message to your self');
//                                   }
//                                 },
//                                 child: BuildSingleScreachResult(
//                                   name: myCubit.docsHasTheSameName[index]
//                                       ['name'],
//                                   email: myCubit.docsHasTheSameName[index]
//                                       ['typeName'],
//                                 ),
//                               );
//                             },
//                             separatorBuilder: (context, index) =>
//                                 const SizedBox(),
//                             itemCount: myCubit.docsHasTheSameName.length,
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ));
//       },
//     );
//   }
// }
