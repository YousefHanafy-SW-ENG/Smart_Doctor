import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_otp/email_otp.dart';
import 'package:doctor_final/core/shared_pref/cash_helper.dart';
import 'package:doctor_final/core/shared_wIdgets/app_dialog.dart';
import 'package:doctor_final/core/shared_wIdgets/app_toast.dart';
import 'package:doctor_final/core/uitls/constants.dart';
import 'package:doctor_final/features/chat/data/models/current_user_info.dart';
import 'package:doctor_final/features/show_result/presentation/widgets/show_toast.dart';
import 'package:doctor_final/features/signup/presentation/widgets/otp_dialog.dart';
import 'package:doctor_final/features/signup/presentation/widgets/personal_info_step.dart';
import 'package:doctor_final/translation/Local_Key.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit getCubit(context) => BlocProvider.of(context);

  Dio dio = Dio();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secoundNameController = TextEditingController();
  TextEditingController thirdNameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController mobiledNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController insuranceIdController = TextEditingController();
  //step 3
  TextEditingController yourHeightController = TextEditingController();
  TextEditingController yourWeightController = TextEditingController();
  TextEditingController bMIController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  String idType = '';
  String gender = '';
  String nationality = '';
  String maritalStatus = '';
  String insuranceName = '';
  String insuranceCompany = '';
  String insuranceType = '';
  String insuranceLevel = '';
  String bMi = '';

  //step 3
  String heightUnit = '';
  String weightUnit = '';
  String bloodType = '';
  String smoking = '';
  String diseases = '';
  String allergies = '';
  String operations = '';
  String medication = '';

  File? radiologyImage;
  File? labImage;
  File? prescriptionImage;

  String radiologyType = '';
  String testName = '';
  String radiologyArea = '';
  String testCategory = '';

  String toClinic = '';
  String labToClinic = '';
  String prescriptionToClinic = '';

  String religion = '';

  String? birthOfDate;
  String? hijriDate;

  File? idFrontImage;
  String idFrontImageName = '';
  File? idBackImage;

  String idBackImageName = '';

  String mobileNumberCountryCode = '+20';

  Map<String, int> idTypeValues = {};
  Map<String, int> genderValues = {};
  Map<String, int> nationalValues = {};
  Map<String, int> maritalStatusValues = {};
  Map<String, int> insuranceNameValues = {};
  Map<String, int> insuranceCompanyValues = {};
  Map<String, int> insuranceTypeValues = {};
  Map<String, int> insuranceLevelValues = {};

  Map<String, int> heightUnitValues = {};
  Map<String, int> weightUnitValues = {};
  Map<String, int> bloodTypeValues = {};
  Map<String, int> smokingValues = {};
  Map<String, int> diseasesValues = {};
  Map<String, int> allergiesValues = {};
  Map<String, int> operationsValues = {};
  Map<String, String> medicationValues = {};
  Map<String, int> radiologyTypeValues = {};
  Map<String, int> testValues = {};
  Map<String, int> testCategoryValues = {};

  Map<String, int> radiologyAreaValues = {};
  Map<String, int> toClinicValues = {};
  Map<String, int> religionValues = {};
  Map<String, int> bMIValues = {};

  List<Map<String, dynamic>> radiologyCollection = [];
  List<Map<String, dynamic>> labCollection = [];
  List<Map<String, dynamic>> prescriptionCollection = [];
  int currentStepIndex = 0;

  DateType currentDateType = DateType.gregorian;

  void calculateBMI() {
    if (yourHeightController.text.isEmpty ||
        yourWeightController.text.isEmpty ||
        yourHeightController.text.startsWith('0') ||
        yourWeightController.text.startsWith('0')) {
      return;
    }
    bMIController.text = (double.parse(yourWeightController.text) /
            (double.parse(yourHeightController.text) *
                double.parse(yourHeightController.text)))
        .toStringAsFixed(3);
  }

  void changeCurrentDateType(DateType value) {
    birthOfDate = null;
    hijriDate = null;
    currentDateType = value;
    emit(ChangeCurrentDateTypeState());
  }

  void changeCurrentStepIndex(int index) {
    currentStepIndex = index;

    emit(ChangeCurrentStepIndexState());
  }

  void addNewRadiologyCollection() {
    if (radiologyImage == null ||
        radiologyType == '' ||
        radiologyArea == '' ||
        toClinic == '') {
      appToast(LocaleKeys.allFieldsAreRequired.tr(), color: Colors.red);
      return;
    }
    radiologyCollection.add({
      'image': radiologyImage,
      'type': radiologyType,
      'area': radiologyArea,
      'clinic': toClinic,
    });
    radiologyImage = null;
    radiologyType == '';
    radiologyArea == '';
    toClinic == '';
    emit(AddNewRadiologyCollectionState());
  }

  void addNewLabCollection() {
    if (labImage == null ||
        testName == '' ||
        testCategory == '' ||
        labToClinic == '') {
      appToast(LocaleKeys.allFieldsAreRequired.tr(), color: Colors.red);
      return;
    }
    labCollection.add({
      'imaage': labImage,
      'testName': testName,
      'testCategory': testCategory,
      'clinic': labToClinic,
    });
    labImage = null;
    testName == '';
    testCategory == '';
    labToClinic == '';
    emit(AddNewLabCollectionState());
  }

  void addNewPrescriptionCollection() {
    if (prescriptionImage == null || prescriptionToClinic == '') {
      appToast(LocaleKeys.allFieldsAreRequired.tr(), color: Colors.red);
      return;
    }
    prescriptionCollection.add({
      'imaage': prescriptionImage,
      'clinic': prescriptionToClinic,
    });
    prescriptionImage = null;

    prescriptionToClinic == '';
    emit(AddNewPrescriptionCollectionState());
  }

  void clearAllSignUpControllers() {
    firstNameController.text = '';
    mobiledNumberController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
    idFrontImage = null;
  }

  bool passwordVisiblility = true;
  // IconData passwordVisiblilityIcon = Icons.visibility_off;
  bool confirmPasswordVisiblility = true;
  // IconData confirmPasswordVisiblilityIcon = Icons.visibility_off;

  void changePasswrdVisibility() {
    passwordVisiblility = false;
    emit(ChangePasswordVisibilityState());
  }

  void clearAllControllers() {
    firstNameController.text = '';
    mobiledNumberController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
  }

  bool isShowPassportNumber = false;
  void showOrHidePassportNumber() {
    if (nationalValues[nationality] == 55 && idTypeValues[idType] == 2) {
      isShowPassportNumber = true;
    } else {
      isShowPassportNumber = false;
    }
    emit(ChangeVisibilityOfPassportNumberState());
  }

  var picker = ImagePicker();

  Future<void> pickIdFrontImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      idFrontImage = imageTemporery;
      idFrontImageName = image.name;

      // showToast(text: 'profile image picked successfully');
      emit(IDNumberImagePickedSucessState());
    } on Exception catch (e) {
      emit(IDNumberImagePickedErrorState());

      debugPrint(e.toString());
    }
  }

  Future<void> pickIdBackImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      idBackImage = imageTemporery;
      idBackImageName = image.name;

      // showToast(text: 'profile image picked successfully');
      emit(IDNumberImagePickedSucessState());
    } on Exception catch (e) {
      emit(IDNumberImagePickedErrorState());

      debugPrint(e.toString());
    }
  }

  Future<void> pickRadiologyImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      radiologyImage = imageTemporery;

      showToast(text: 'image picked successfully');
      emit(RadiologyImagePickedSucessState());
    } on Exception catch (e) {
      emit(RadiologyImagePickedErrorState());

      debugPrint(e.toString());
    }
  }

  Future<void> pickLabImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      labImage = imageTemporery;

      showToast(text: 'image picked successfully');
      emit(LabImagePickedSucessState());
    } on Exception catch (e) {
      emit(LabImagePickedErrorState());

      debugPrint(e.toString());
    }
  }

  Future<void> pickPrescriptionImage() async {
    try {
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      var imageTemporery = File(image.path);
      prescriptionImage = imageTemporery;

      showToast(text: 'image picked successfully');
      emit(PrescriptoinImagePickedSucessState());
    } on Exception catch (e) {
      emit(PrescriptoinImagePickedErrorState());

      debugPrint(e.toString());
    }
  }

  int getLocale(BuildContext context) {
    return EasyLocalization.of(context)!.locale == const Locale('en') ? 2 : 1;
  }

  Future<void> getNationalityValues(context) async {
    emit(LoadingNationalityValuesState());
    nationality = '';
    nationalValues.clear();
    final Map<String, dynamic> data = {
      "gender": genderValues[gender].toString(),
      "language": getLocale(context),
      "CountryCode": 2,
      "nationalityID": null,
      "nationality": null
    };
    await dio
        .post(
      "${AppConstants.baseUrl}/api/SmartPatientSelectNationality",
      data: data,
    )
        .then((value) {
      value.data.forEach((element) {
        nationalValues
            .addAll({element['nationality'].trim(): element['nationalityID']});
      });
      emit(GetNationalityValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getGenderValues(context) async {
    genderValues.clear();
    print(getLocale(context));
    print(getLocale(context).toString());
    await dio.post("${AppConstants.baseUrl}/api/SmartPatientSelectGenderType",
        data: {
          "language": getLocale(context).toString(),
        }).then((value) {
      print(value.data);
      value.data.forEach((element) {
        genderValues
            .addAll({element['genderType'].trim(): element['genderTypeID']});
      });
      emit(GetGenderValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getIdTypeValues(context) async {
    idTypeValues.clear();
    await dio
        .post("${AppConstants.baseUrl}/api/SmartPatientSelectIDType", data: {
      "language": getLocale(context),
    }).then((value) {
      value.data.forEach((element) {
        idTypeValues.addAll({element['idType'].trim(): element['idTypeID']});
      });
      emit(GetIdTypeValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getReligionValues(context) async {
    religionValues.clear();
    await dio
        .post("${AppConstants.baseUrl}/api/SmartPatientSelectReligion", data: {
      "language": getLocale(context),
    }).then((value) {
      print(value.data);
      value.data.forEach((element) {
        religionValues
            .addAll({element['religion'].trim(): element['religionID']});
      });
      emit(ReligionLoadedState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getMaritalStatusValues(context) async {
    emit(LoadingMaritalValuesState());
    maritalStatusValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectMaritalStatus",
        data: {
          "gender": genderValues[gender].toString(),
          "language": getLocale(context),
        }).then((value) {
      value.data.forEach((element) {
        maritalStatusValues
            .addAll({element['maritalStatus']: element['maritalStatusID']});
      });
      emit(GetMaritalStatusValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<List<dynamic>> getInsuranceNameValues(
      context, String searchKey) async {
    if (searchKey.length < 2) return [];
    insuranceNameValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectInsuranceName",
        data: {
          "insCode": null,
          "insName": searchKey,
        }).then((value) {
      value.data.forEach((element) {
        insuranceNameValues
            .addAll({element['insName'] ?? '': element['insCode']});
      });
      // emit(GetInsuranceNamesValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
    return insuranceNameValues.keys.toList();
  }

  Future<void> getInsuranceCompanyValues(int insuranceName) async {
    emit(LoadingInsuranceValuesState());
    insuranceCompany = '';
    insuranceCompanyValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectInsuranceCompany",
        data: {"insCode": insuranceName}).then((value) {
      value.data.forEach((element) {
        insuranceCompanyValues
            .addAll({element['compName']: element['compCode']});
      });
      emit(GetInsuranceCompanyValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  // Future<void> getInsuranceTypeValues(context) async {
  //   insuranceTypeValues.clear();
  //   await dio.post(
  //       "${AppConstants.baseUrl}/api/SmartPatientSelectInsuranceType",
  //       data: {
  //         "language": getLocale(context),
  //       }).then((value) {
  //     value.data.forEach((element) {
  //       insuranceTypeValues.addAll({element['insType']: element['insTypeID']});
  //     });
  //     emit(GetInsuranceTypeValuesSucessState());
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //   });
  // }

  Future<List> getInsuranceLevelValues(String searchKey) async {
    if (searchKey.length < 2) return [];
    insuranceLevelValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectInsuranceLevel",
        data: {
          "levelcode": null,
          "levelname": searchKey,
        }).then((value) {
      value.data.forEach((element) {
        insuranceLevelValues
            .addAll({element['levelname']: element['levelcode']});
      });
      emit(GetInsuranceLevelValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
    return insuranceLevelValues.keys.toList();
  }

  Future<void> getHeigtValues(context) async {
    heightUnitValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectMeasureUnitHeight",
        data: {
          "heightUnitID": null,
          "heightUnit": null,
          "isDefault": null,
          "language": getLocale(context),
        }).then((value) {
      value.data.forEach((element) {
        heightUnitValues
            .addAll({element['heightUnit']: element['heightUnitID']});
      });
      emit(GetHeigthUnitValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getWeightValues(context) async {
    weightUnitValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectMeasureUnitWeight",
        data: {
          "weightUnitID": null,
          "weightUnit": null,
          "isDefault": null,
          "language": getLocale(context),
        }).then((value) {
      value.data.forEach((element) {
        weightUnitValues
            .addAll({element['weightUnit']: element['weightUnitID']});
      });
      emit(GetWeigthUnitValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getBloodTypeValues() async {
    bloodTypeValues.clear();
    await dio
        .post("${AppConstants.baseUrl}/api/SmartPatientSelectBloodType", data: {
      "bloodTypeID": null,
      "bloodType": null,
    }).then((value) {
      value.data.forEach((element) {
        bloodTypeValues.addAll({element['bloodType']: element['bloodTypeID']});
      });
      emit(GetBloodTypeValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getDiseasesValues(context) async {
    diseasesValues.clear();
    await dio
        .post("${AppConstants.baseUrl}/api/SmartPatientSelectDiseases", data: {
      "diseaseID": null,
      "disease": null,
      "language": getLocale(context),
    }).then((value) {
      value.data.forEach((element) {
        diseasesValues.addAll({element['disease']: element['diseaseID']});
      });
      emit(GetDiseasesValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getAllerigiesValues(context) async {
    allergiesValues.clear();
    await dio
        .post("${AppConstants.baseUrl}/api/SmartPatientSelectAllergens", data: {
      "allergyID": null,
      "allergy": null,
      "language": getLocale(context),
    }).then((value) {
      value.data.forEach((element) {
        allergiesValues.addAll({element['allergy']: element['allergyID']});
      });
      emit(GetAllergiesValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getOperationValues() async {
    operationsValues.clear();
    await dio.post("${AppConstants.baseUrl}/api/SmartPatientSelectOperations",
        data: {
          "operationCode": null,
          "operationName": null,
          "operationType": null
        }).then((value) {
      value.data.forEach((element) {
        operationsValues
            .addAll({element['operationName']: element['operationCode']});
      });
      emit(GetOperationsValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getMedicationValues() async {
    medicationValues.clear();
    await dio.post("${AppConstants.baseUrl}/api/SmartPatientSelectMedication",
        data: {
          "medicationCode": null,
          "medicationName": null,
        }).then((value) {
      value.data.forEach((element) {
        medicationValues
            .addAll({element['medicationName']: element['medicationCode']});
      });
      emit(GetMedicationValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getRadiologyTypeValues(context) async {
    radiologyTypeValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectRadiologyType",
        data: {
          "radiologyTypeID": null,
          "radiologyType": null,
          "language": getLocale(context),
        }).then((value) {
      value.data.forEach((element) {
        radiologyTypeValues
            .addAll({element['radiologyType']: element['radiologyTypeID']});
      });
      emit(GetRadiologyValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getRadiologyAreaValues(context) async {
    radiologyAreaValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectRadiologyArea",
        data: {
          "radiologyAreaID": null,
          "radiologyArea": null,
          "language": getLocale(context),
        }).then((value) {
      value.data.forEach((element) {
        radiologyAreaValues
            .addAll({element['radiologyArea']: element['radiologyAreaID']});
      });
      emit(GetRadiologyAreaValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> getToClinicValues(context) async {
    toClinicValues.clear();
    await dio.post("${AppConstants.baseUrl}/api/SmartPatientSelectDepartment",
        data: {
          "departmentID": null,
          "department": null,
          "language": getLocale(context),
        }).then((value) {
      value.data.forEach((element) {
        toClinicValues.addAll({element['department']: element['departmentID']});
      });
      emit(GetToClinicValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  // http://192.168.1.200:91/api/SmartPatientRegister

  Future<void> sendPersonalDataToApi(context) async {
    FormData formData = FormData.fromMap({
      'Language': getLocale(context),
      'FirstName': firstNameController.text,
      'SecondName': secoundNameController.text,
      'ThirdName': thirdNameController.text,
      'FamilyName': familyNameController.text,
      'Gender': genderValues[gender],
      'IsHijri': currentDateType == DateType.hijri,
      'Birth': birthOfDate,
      'HijriBirth': hijriDate,
      'Nationality': nationalValues[nationality],
      'IDType': idTypeValues[idType],
      'IDNumber': idNumberController.text,
      'PassportNumber': passportNumberController.text,
      'MobileNumber': mobiledNumberController.text,
      'Email': emailController.text,
      'MaritalStatusID': maritalStatusValues[maritalStatus],
      'Address': adressController.text,
      'Job': jobController.text,
      'Religion': religionValues[religion],
      'Inscode': insuranceNameValues[insuranceName],
      'InsID': insuranceIdController.text,
      'InsTypeID': 0,
      'CompCode': insuranceCompanyValues[insuranceCompany],
      'LevelCode': insuranceLevelValues[insuranceLevel],
      'Password': passwordController.text,
    });
    try {
      Response response = await dio.post(
        '${AppConstants.baseUrl}/api/SmartPatientRegister',
        data: formData,
      );
      if (response.statusCode == 200) {
        if (response.data[0]['errorNumber'] == '0') {
          sendOtp();
          appDialog(const OtpDialog(), context);
          CashHelper.saveData(key: 'userId', value: response.data[0]['serial']);
          CurrentUserInfo.uId = response.data[0]['serial'];
          print(CurrentUserInfo.uId);
          return;
        }
        if (response.data[0]['errorNumber'] == '16') {
          appToast(LocaleKeys.thisDataHasBeenRegisterd.tr(), color: Colors.red);
          return;
        }

        debugPrint(" the response is ${response.data.toString()}");
      } else {
        debugPrint("the error is ${response.statusMessage}");
        debugPrint("ther data in error is ${response.data.toString()}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getSmokingValues(context) async {
    smokingValues.clear();
    await dio.post(
        "${AppConstants.baseUrl}/api/SmartPatientSelectSmokingStatus",
        data: {
          "gender": "1",
          "language": getLocale(context),
        }).then((value) {
      value.data.forEach((element) {
        smokingValues
            .addAll({element['smokingStatus']: element['smokingStatusID']});
      });
      emit(GetSmokingValuesSucessState());
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  Future<void> sendMedicalInfoToApi(context) async {
    await dio
        .post("${AppConstants.baseUrl}/api/SmartPatientSaveMedicalData", data: {
          "registerRequestID": AppConstants.isCurrentThemeDark,
          "height": int.parse(yourHeightController.text),
          "heightUnitID": heightUnitValues[heightUnit],
          "weight": int.parse(yourWeightController.text),
          "weightUnitID": weightUnitValues[weightUnit],
          "bloodTypeID": bloodTypeValues[bloodType],
          "isSmoker": smokingValues[smoking],
        })
        .then((value) {})
        .catchError((error) {
          debugPrint(error.toString());
        });
  }

  Future<void> sendMedicalHistoryToApi(context) async {
    await dio
        .post("${AppConstants.baseUrl}/api/SmartPatientSaveMedicalHistory",
            data: {
              "registerRequestID": AppConstants.registerID,
              "medicalHistoryType": 1,
              "diseaseID": "5",
              "operationId": "NULL",
              "allergenId": "NULL",
              "medicationID": "NULL"
            })
        .then((value) {})
        .catchError((error) {
          debugPrint(error.toString());
        });
  }

  EmailOTP myauth = EmailOTP();
  void sendOtp() async {
    myauth.setConfig(
      appEmail: "ShadiSystems@SH.com",
      appName: "Smart Patient OTP",
      userEmail: emailController.text,
      otpLength: 6,
      otpType: OTPType.digitsOnly,
    );

    if (await myauth.sendOTP() == true) {
      appToast(LocaleKeys.otpHasBeenSent.tr());
    } else {
      appToast(LocaleKeys.otpSendFaild.tr(), color: Colors.red);
    }
  }

  Future<bool> validateOtp(String otp) async {
    if (await myauth.verifyOTP(otp: otp) == true) {
      return true;
    } else {
      return false;
    }
  }
}
