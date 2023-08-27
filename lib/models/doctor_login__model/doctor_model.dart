

class DoctorLoginModel {
  String doctorName;
   int   doctorCode;
   String? ff;
   int?   cc;

  DoctorLoginModel(
      {
        required   this.doctorName,
        required   this.doctorCode,
            this.ff,
            this.cc,

      });

  factory DoctorLoginModel.fromJson(Map<String, dynamic> jsonData) {
    return DoctorLoginModel(
      doctorName: jsonData['doctorName'],
      doctorCode: jsonData['doctorcode'],

    );
  }
}