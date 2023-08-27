import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:doctor_final/features/show_result/presentation/widgets/show_toast.dart';
import 'package:doctor_final/id_information_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/uitls/app_strings.dart';

part 'medical_report_state.dart';

class MedicalReportCubit extends Cubit<MedicalReportStates> {
  MedicalReportCubit() : super(MedicalReportInitial());

  static MedicalReportCubit getCubit(context) => BlocProvider.of(context);

  var picker = ImagePicker();
  File? profileImage;
  File? idImage;
  File? xRayImage;
  File? labReportImage;
  String dateOfBirth = '3-2-1999';

  List<String> maritalStatusValues = [
    'Married',
    'Single',
    'Divorced',
  ];
  String maritalStautsValue = '';

  List<String> insuranceCompanyValues = [
    'Company 1',
    'Company 2',
    'Company 3',
  ];

  String insuranceCompanyValue = '';

  TextEditingController mobildNumberController = TextEditingController();
  TextEditingController homePhoneController = TextEditingController();
  TextEditingController insuranceNumberController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  int genderSelectedElementIndex = 0;
  String genderController = AppStrings.male;

  int idTypeSelectedElementIndex = 0;
  String idTypeController = AppStrings.nationalId;

  void changeGenderValue({
    required int selectedElementindex,
    required String selectedElementValue,
  }) {
    genderSelectedElementIndex = selectedElementindex;
    genderController = selectedElementValue;
    emit(ChangeGenderValueSucessState());
  }

  void changeIdTypeValue({
    required int selectedElementindex,
    required String selectedElementValue,
  }) {
    idTypeSelectedElementIndex = selectedElementindex;
    idTypeController = selectedElementValue;
    emit(ChangeIdTypeValueSucessState());
  }

  Future<void> pickProfileImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      profileImage = imageTemporery;

      showToast(text: 'profile image picked successfully');
      emit(ProfileImagePickedSucessState());
    } on Exception catch (e) {
      emit(ProfileImagePickedErrorState());

      debugPrint(e.toString());
    }
  }

  Future<void> pickIdImages() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      idImage = imageTemporery;

      showToast(text: 'id image picked successfully');
      emit(ProfileImagePickedSucessState());
    } on Exception catch (e) {
      showToast(text: e.toString());
      emit(ProfileImagePickedErrorState());
    }
  }

  Future<void> pcikXRayImages() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      xRayImage = imageTemporery;

      showToast(text: 'id image picked successfully');
      emit(XRayImagePickedSucessState());
    } on Exception catch (e) {
      showToast(text: e.toString());
      emit(XRayImagePickedErrorState());
    }
  }

  Future<void> pcikLabReportImages() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      labReportImage = imageTemporery;

      showToast(text: 'id image picked successfully');
      emit(LabReportImagePickedSucessState());
    } on Exception catch (e) {
      showToast(text: e.toString());
      emit(LabReportImagePickedErrorState());
    }
  }

  void changeDateController({required String value}) {
    dateOfBirth = value;

    emit(ChangeDateOfBirthState());
  }

  void changeMaritalStautsValue({required String value}) {
    maritalStautsValue = value;
    emit(ChangeMaritalStatusValueState());
  }

  void changeInsuranceCompanyValue({required String value}) {
    insuranceCompanyValue = value;
    emit(ChangeMaritalStatusValueState());
  }

  void clearAllMedicalReportScreenControllers() {
    dateOfBirth = '3-2-1999';
    maritalStautsValue = '';
    insuranceCompanyValue = '';
    mobildNumberController.text = '';
    homePhoneController.text = '';
    genderSelectedElementIndex = 0;
    genderController = AppStrings.male;
    idTypeSelectedElementIndex = 0;
    idTypeController = AppStrings.nationalId;
    idImage = null;
    xRayImage = null;
    labReportImage = null;
    insuranceNumberController.text = '';
    adressController.text = '';
    idNumberController.text = '';
    profileImage = null;
    fullNameController.text = '';
  }

  // IdInformationModel? idInformationModel;
  // void sendImageToApi() {
  //   try {
  //     DioHelper.postData(
  //       data: {
  //         'image': idImage,
  //         'type': 'id',
  //         'face': frontOrBack[0],
  //       },
  //     ).then((value) {
  //       idInformationModel = IdInformationModel.fromJson(value.data);
  //       debugPrint(idInformationModel!.name);
  //       debugPrint(idInformationModel!.adress);
  //       debugPrint(idInformationModel!.ssn);
  //       // debugPrint(value);
  //     }).catchError((error) {
  //       debugPrint(error.toString());
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  List<String> frontOrBack = ['front', 'back'];
  IdInformationModel? idInformationModel;
  String response = '';
  void sendImageToApi() async {
    try {
      // print('iam in  the try');

      // var response = await Dio().post(
      //     'https://pretty-dingos-chew-156-194-105-239.loca.lt/api/extract',
      // queryParameters: {
      //   'image': idImage,
      //   'type': 'id',
      // });
      // idInformationModel = IdInformationModel.fromJson(response.data);
      // response = response.data;
      // print(response.data);
      // emit(SucessState());

      var url = Uri.https(
          'pretty-dingos-chew-156-194-105-239.loca.lt', '/api/extract');

      await http.post(url, body: {
        'image': idImage,
        'type': 'id',
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
