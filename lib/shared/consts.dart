import 'package:doctor_final/models/lab_result_model.dart';
import 'package:doctor_final/models/radiology_result/radiology_result_model.dart';
import 'package:doctor_final/patient/patient_model.dart';
import 'package:doctor_final/prescrtion.dart';
import 'package:flutter/cupertino.dart';

import '../models/AccModel.dart';
import '../models/doctorProfileModel.dart';
import '../models/doctor_login__model/doctor_model.dart';
import '../models/inPatientModel.dart';
import '../models/prescision_model.dart';
import '../models/visits_model.dart';

// class AppConst{

List<DoctorLoginModel> getLoginDoctor = [];
List<PatientModel> getPatient = [];
List<LabResultModel> getLabResult = [];
List<RadiologyModel> getRadiologyResult = [];
List<PrecisionModel> getPrecision = [];
List<VisitModel> getVisit = [];
TextEditingController searchNameController = TextEditingController();
TextEditingController searchIdController = TextEditingController();
bool? RememberMe_myCheckBox_value = false;
var profileResponse;

// bool is_Loading = false;

List<Recieve_InPatient_Model> getInPatient = [];
List<doctorProfile_Model> getDoctorProfileList = [];

int Selected_index = 0;

bool showImage = false;
List<AccModel> getAcc  = [];

int selectedIndexxx = 0;

String kh = 'cc';
// }