class Recieve_InPatient_Model {
  int? pserial;
  String? admissionDate;
  String? dischargeDate;
  String? doctor;
  String? patientState;
  int? patientID;
  int? registerRequestID;
  String? fullName;
  String? gender;
  var maritalStatus;
  String? dateOfBirth;
  int? age;
  String? idType;
  String? idNumber;
  var passportNumber;
  String? nationality;
  var email;
  String? mobileNumber;
  String? theAddress;
  String? job;
  int? height;
  var heightUnit;
  int? theWeight;
  var weightUnit;
  var bloodType;
  var smokingStatus;
  var insuranceName;
  String? insuranceCompany;
  String? insuranceLevel;
  var insuranceNumber;
  var registeredVia;
  String? registerationDate;
  var profilePic;

  Recieve_InPatient_Model(
      {this.pserial,
        this.admissionDate,
        this.dischargeDate,
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

  factory Recieve_InPatient_Model.fromJson(Map<String, dynamic> json) {
    return Recieve_InPatient_Model(
      pserial: json['pserial'],
      admissionDate: json['admissionDate'],
      dischargeDate: json['dischargeDate'],
      doctor: json['doctor'],
      patientState: json['patientState'],
      patientID: json['patientID'],
      registerRequestID: json['registerRequestID'],
      fullName: json['fullName'],
      gender: json['gender'],
      maritalStatus: json['maritalStatus'],
      dateOfBirth: json['dateOfBirth'],
      age: json['age'],
      idType: json['idType'],
      idNumber: json['idNumber'],
      passportNumber: json['passportNumber'],
      nationality: json['nationality'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      theAddress: json['theAddress'],
      job: json['job'],
      height: json['height'],
      heightUnit: json['heightUnit'],
      theWeight: json['theWeight'],
      weightUnit: json['weightUnit'],
      bloodType: json['bloodType'],
      smokingStatus: json['smokingStatus'],
      insuranceName: json['insuranceName'],
      insuranceCompany: json['insuranceCompany'],
      insuranceLevel: json['insuranceLevel'],
      insuranceNumber: json['insuranceNumber'],
      registeredVia: json['registeredVia'],
      registerationDate: json['registerationDate'],
      profilePic: json['profilePic'],

    );

  }
}