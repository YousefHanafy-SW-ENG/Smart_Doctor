class VisitModel {
  int? visitID;
  String? visitDate;
  String? visitType;
  int? visitNo;
  String? primaryNotes;
  bool? isClosed;
  int? doctorID;
  String? docname;
  int? specialityID;
  Null? specialityARName;

  VisitModel({this.visitID,
    this.visitDate,
    this.visitType,
    this.visitNo,
    this.primaryNotes,
    this.isClosed,
    this.doctorID,
    this.docname,
    this.specialityID,
    this.specialityARName});
  factory VisitModel.fromJson(Map<String, dynamic> jsonData) {
    return VisitModel(
      visitDate: jsonData['visitDate'],
      visitType: jsonData['visitType'],
      visitNo: jsonData['visitNo'],
      primaryNotes: jsonData['primaryNotes'],
      isClosed: jsonData['isClosed'],
      doctorID: jsonData['doctorID'],
      docname: jsonData['docname'],
      specialityID: jsonData['specialityID'],
      specialityARName:jsonData['specialityARName'],
    );
  }
}