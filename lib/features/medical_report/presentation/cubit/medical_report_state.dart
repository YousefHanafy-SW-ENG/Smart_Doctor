part of 'medical_report_cubit.dart';

abstract class MedicalReportStates {}

class MedicalReportInitial extends MedicalReportStates {}

class ChangeGenderValueSucessState extends MedicalReportStates {}

class ChangeIdTypeValueSucessState extends MedicalReportStates {}

class ProfileImagePickedSucessState extends MedicalReportStates {}

class ProfileImagePickedErrorState extends MedicalReportStates {}

class XRayImagePickedSucessState extends MedicalReportStates {}

class XRayImagePickedErrorState extends MedicalReportStates {}

class LabReportImagePickedSucessState extends MedicalReportStates {}

class LabReportImagePickedErrorState extends MedicalReportStates {}

class ChangeDateOfBirthState extends MedicalReportStates {}

class ChangeMaritalStatusValueState extends MedicalReportStates {}

class ChangeInsuranceCompanyValueState extends MedicalReportStates {}

class SucessState extends MedicalReportStates {}
