class doctorProfile_Model {

  int? doctorID;
  int? doctorCode;
  String? docname;
  String? enDocName;
  String? dateOfBirth;
  var gender;
  var doctorGrade;
  String? doctorAddress;
  var mobile;
  var drLanguage;
  String? nationality;
  String? speciality;
  var degree;
  String? notes;
  var department;
  bool? isDoctor;
  bool? isResident;

  doctorProfile_Model({
      this.doctorID,
      this.doctorCode,
      this.docname,
      this.enDocName,
      this.dateOfBirth,
      this.gender,
      this.doctorGrade,
      this.doctorAddress,
      this.mobile,
      this.drLanguage,
      this.nationality,
      this.speciality,
      this.degree,
      this.notes,
      this.department,
      this.isDoctor,
      this.isResident
      });


    factory doctorProfile_Model.fromJson(Map<String, dynamic> json) {
    return doctorProfile_Model(
      
    doctorID : json['doctorID'],
    doctorCode : json['doctorCode'],
    docname : json['docname'],
    enDocName : json['enDocName'],
    dateOfBirth : json['dateOfBirth'],
    gender : json['gender'],
    doctorGrade : json['doctorGrade'],
    doctorAddress : json['doctorAddress'],
    mobile : json['mobile'],
    drLanguage : json['drLanguage'],
    nationality : json['nationality'],
    speciality : json['speciality'],
    degree : json['degree'],
    notes : json['notes'],
    department : json['department'],
    isDoctor : json['isDoctor'],
    isResident :json['isResident'],

    );
  }
}
