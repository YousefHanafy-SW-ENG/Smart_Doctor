import 'package:doctor_final/core/uitls/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

part 'show_result_state.dart';

class ShowResultCubit extends Cubit<ShowResultState> {
  ShowResultCubit() : super(ShowResultInitial());

  ShowResultCubit getCubit(context) => BlocProvider.of(context);

  List<bool> prescriptionsImagesController = [false, false, false];
  List<bool> reportsImagesController = [false, false, false];
  List<IconData> prescriptionEyeIconsController = [
    Icons.visibility,
    Icons.visibility,
    Icons.visibility,
  ];
  List<IconData> reportEyeIconsController = [
    Icons.visibility,
    Icons.visibility,
    Icons.visibility,
  ];

  List<Map> radiologyDummyData = [
    {
      'testDate': '22/5/2022',
      'testType': 'Outpatinet',
      'testName': 'Ultra ',
      'prescriptionImage': ImageManager.reportImage3,
      'reportImage': ImageManager.prescriptionImage3,
    },
    {
      'testDate': '1/1/2010',
      'testType': 'inPatient',
      'testName': 'CT Spines',
      'prescriptionImage': ImageManager.reportImage2,
      'reportImage': ImageManager.prescriptionImage2,
    },
    {
      'testDate': '12/2/2008',
      'testType': 'Emergency',
      'testName': 'Ultra Sound',
      'prescriptionImage': ImageManager.reportImage,
      'reportImage': ImageManager.prescriptionImage,
    },
  ];

  List<bool> labImagesController = [false, false, false];
  List<IconData> labEyeIconsController = [
    Icons.visibility,
    Icons.visibility,
    Icons.visibility,
  ];
  List<Map> labDummyData = [
    {
      'testDate': '21/5/2012',
      'testType': 'Emergency',
      'testName': 'Ultra',
      'prescriptionImage': ImageManager.prescriptionImage5,
    },
    {
      'testDate': '1/1/2010',
      'testType': 'inPatient',
      'testName': 'CT Spines',
      'prescriptionImage': ImageManager.prescriptionImage6,
    },
    {
      'testDate': '12/2/2008',
      'testType': 'Outpatinet',
      'testName': 'Ultra Sound',
      'prescriptionImage': ImageManager.prescriptionImage7,
    },
  ];

  void togglePrescriptionImageVisibility({
    required int index,
  }) {
    if (prescriptionsImagesController[index] == true) {
      prescriptionsImagesController[index] = false;
      prescriptionEyeIconsController[index] = Icons.visibility;
      // emit(OpenPrescriptionImagesState());
    } else {
      prescriptionsImagesController[index] = true;
      prescriptionEyeIconsController[index] = Icons.visibility_off;
    }
    emit(ClosePrescriptionImagesState());
  }

  void toggleReportImageVisibility({
    required int index,
  }) {
    if (reportsImagesController[index] == true) {
      reportsImagesController[index] = false;
      reportEyeIconsController[index] = Icons.visibility;
      // emit(OpenPrescriptionImagesState());
    } else {
      reportsImagesController[index] = true;
      reportEyeIconsController[index] = Icons.visibility_off;
    }
    emit(ClosePrescriptionImagesState());
  }

  void toggleLabImageVisibility({
    required int index,
  }) {
    if (labImagesController[index] == true) {
      labImagesController[index] = false;
      labEyeIconsController[index] = Icons.visibility;
      // emit(OpenLabImagesState());
    } else {
      labImagesController[index] = true;
      labEyeIconsController[index] = Icons.visibility_off;
    }
    emit(OpenLabImagesState());
  }

  IconData reportEyeIcon = Icons.visibility;

  String radiologyAndReportMainImage = ImageManager.prescriptionImage;
  bool showOutPatient = false;
  String testNameController = 'Outpatient';
  String testTypeController = 'PCR Test  ';

  String dateController = '22/5/2022';
  bool overLayWidgetIsOpen = false;

  void changeTestTypeValue({required String value}) {
    testTypeController = value;
    emit(ChangeTestTypeValueState());
  }

  void changeTestNameValue({required String value}) {
    testNameController = value;
    emit(ChangeTestNameValueState());
  }

  void closeAllScreens() {
    reportEyeIcon = Icons.visibility_off;
  }

  void changeDateController(
      {required String controllerName, required String value}) {
    dateController = value;

    emit(ChangeValueState());
  }

  void closeAllImages() {
    reportEyeIcon = Icons.visibility_off;

    emit(CloseAllImagesState());
  }

  void shareData() async {
    await Share.share(
      'https://pub.dev/packages/share_plus',
      subject: 'message',
    ).then((value) {
      emit(DataSharedSuccessfullyState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(DataSharedErrorState());
    });
  }
}
