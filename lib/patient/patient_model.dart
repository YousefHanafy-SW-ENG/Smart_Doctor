import 'package:easy_localization/easy_localization.dart';

class PatientModel {
  int? visitID;
  int? visitNo;
  String? visitDate;
  String? visitType;
  String? primaryNotes;
  String? doctor;
  String? patientState;
  int? patientID;
  int? registerRequestID;
  String? fullName;
  String? gender;
  Null? maritalStatus;
  String? dateOfBirth;
  int? age;
  String? idType;
  String? idNumber;
  Null? passportNumber;
  String? nationality;
  Null? email;
  String? mobileNumber;
  String? theAddress;
  String? job;
  int? height;
  Null? heightUnit;
  int? theWeight;
  Null? weightUnit;
  Null? bloodType;
  Null? smokingStatus;
  Null? insuranceName;
  String? insuranceCompany;
  String? insuranceLevel;
  Null? insuranceNumber;
  Null? registeredVia;
  String? registerationDate;
  Null? profilePic;

  PatientModel(
      {this.visitID,
        this.visitNo,
        this.visitDate,
        this.visitType,
        this.primaryNotes,
        this.doctor,
        this.patientState,
        this.patientID,
        this.registerRequestID,
        this.fullName,
        this.gender,
        this.maritalStatus,
        this.dateOfBirth,
        this.age,
        this.idType,
        this.idNumber,
        this.passportNumber,
        this.nationality,
        this.email,
        this.mobileNumber,
        this.theAddress,
        this.job,
        this.height,
        this.heightUnit,
        this.theWeight,
        this.weightUnit,
        this.bloodType,
        this.smokingStatus,
        this.insuranceName,
        this.insuranceCompany,
        this.insuranceLevel,
        this.insuranceNumber,
        this.registeredVia,
        this.registerationDate,
        this.profilePic});
  factory PatientModel.fromJson(Map<String, dynamic> jsonData) {
    return PatientModel(
      fullName: jsonData['fullName'],
      visitDate: jsonData['visitDate'],
      patientID: jsonData['patientID'],
      gender: jsonData['gender'],
      age: jsonData['age'],
      idNumber: jsonData['idNumber'],
      mobileNumber: jsonData['mobileNumber'],
      insuranceCompany: jsonData['insuranceCompany'],
      nationality:jsonData['nationality'],
      insuranceLevel:jsonData['insuranceLevel'],
      dateOfBirth: jsonData['dateOfBirth']

    );
  }
  // PatientModel.fromJson(Map<String, dynamic> json) {
  //   pserial = json['pserial'];
  //   admissionDate = json['admissionDate'];
  //   dischargeDate = json['dischargeDate'];
  //   doctor = json['doctor'];
  //   patientState = json['patientState'];
  //   patientID = json['patientID'];
  //   registerRequestID = json['registerRequestID'];
  //   fullName = json['fullName'];
  //   gender = json['gender'];
  //   maritalStatus = json['maritalStatus'];
  //   dateOfBirth = json['dateOfBirth'];
  //   age = json['age'];
  //   idType = json['idType'];
  //   idNumber = json['idNumber'];
  //   passportNumber = json['passportNumber'];
  //   nationality = json['nationality'];
  //   email = json['email'];
  //   mobileNumber = json['mobileNumber'];
  //   theAddress = json['theAddress'];
  //   job = json['job'];
  //   height = json['height'];
  //   heightUnit = json['heightUnit'];
  //   theWeight = json['theWeight'];
  //   weightUnit = json['weightUnit'];
  //   bloodType = json['bloodType'];
  //   smokingStatus = json['smokingStatus'];
  //   insuranceName = json['insuranceName'];
  //   insuranceCompany = json['insuranceCompany'];
  //   insuranceLevel = json['insuranceLevel'];
  //   insuranceNumber = json['insuranceNumber'];
  //   registeredVia = json['registeredVia'];
  //   registerationDate = json['registerationDate'];
  //   profilePic = json['profilePic'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['pserial'] = this.pserial;
  //   data['admissionDate'] = this.admissionDate;
  //   data['dischargeDate'] = this.dischargeDate;
  //   data['doctor'] = this.doctor;
  //   data['patientState'] = this.patientState;
  //   data['patientID'] = this.patientID;
  //   data['registerRequestID'] = this.registerRequestID;
  //   data['fullName'] = this.fullName;
  //   data['gender'] = this.gender;
  //   data['maritalStatus'] = this.maritalStatus;
  //   data['dateOfBirth'] = this.dateOfBirth;
  //   data['age'] = this.age;
  //   data['idType'] = this.idType;
  //   data['idNumber'] = this.idNumber;
  //   data['passportNumber'] = this.passportNumber;
  //   data['nationality'] = this.nationality;
  //   data['email'] = this.email;
  //   data['mobileNumber'] = this.mobileNumber;
  //   data['theAddress'] = this.theAddress;
  //   data['job'] = this.job;
  //   data['height'] = this.height;
  //   data['heightUnit'] = this.heightUnit;
  //   data['theWeight'] = this.theWeight;
  //   data['weightUnit'] = this.weightUnit;
  //   data['bloodType'] = this.bloodType;
  //   data['smokingStatus'] = this.smokingStatus;
  //   data['insuranceName'] = this.insuranceName;
  //   data['insuranceCompany'] = this.insuranceCompany;
  //   data['insuranceLevel'] = this.insuranceLevel;
  //   data['insuranceNumber'] = this.insuranceNumber;
  //   data['registeredVia'] = this.registeredVia;
  //   data['registerationDate'] = this.registerationDate;
  //   data['profilePic'] = this.profilePic;
  //   return data;
  // }
}