class RadiologyModel {
  int? serial;
  int? rcode;
  int? raycode;
  int? patid;
  String? creadate;
  String? diagnosis;
  int? doccode;
  int? inscode;
  int? levelCode;
  String? pdate;
  String? repType;
  String? xReport;
  String? header;
  String? footer;
  String? remarks;
  String? studyID;
  int? uscode;
  String? userName;
  int? compCode;
  String? computerName;
  String? docname;
  String? rname;

  RadiologyModel({this.serial,
    this.rcode,
    this.raycode,
    this.patid,
    this.creadate,
    this.diagnosis,
    this.doccode,
    this.inscode,
    this.levelCode,
    this.pdate,
    this.repType,
    this.xReport,
    this.header,
    this.footer,
    this.remarks,
    this.studyID,
    this.uscode,
    this.userName,
    this.compCode,
    this.computerName,
    this.docname,
    this.rname});
  factory RadiologyModel.fromJson(Map<String, dynamic> jsonData) {
    return RadiologyModel(
      rcode: jsonData['rcode'],
      raycode: jsonData['raycode'],
      patid: jsonData['patid'],
      creadate: jsonData['creadate'],
      diagnosis: jsonData['diagnosis'],
      doccode: jsonData['doccode'],
      inscode: jsonData['inscode'],
      levelCode: jsonData['levelCode'],
      pdate:jsonData['pdate'],
      repType:jsonData['repType'],
      xReport: jsonData['xReport'],
      header: jsonData['header'],
      footer: jsonData['footer'],
      remarks: jsonData['remarks'],
      studyID: jsonData['studyID'],
      uscode: jsonData['uscode'],
      userName: jsonData['userName'],
      compCode: jsonData['compCode'],
      computerName: jsonData['computerName'],
      docname: jsonData['docname'],
      rname: jsonData['rname'],
    );
}
}