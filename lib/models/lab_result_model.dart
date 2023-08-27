class LabResultModel {
  int? serial;
  int? patcode;
  int? mcode;
  String? adate;
  int? doccode;
  String? labno;
  int? state;
  String? notes;
  bool? reviewed;
  int? revUscode;
  String? docname;
  String? sampledate;
  num? age;
  int? gender;
  int? oSerial;
  String? roname;
  String? revdate;
  String? name;

  LabResultModel({this.serial,
    this.patcode,
    this.mcode,
    this.adate,
    this.doccode,
    this.labno,
    this.state,
    this.notes,
    this.reviewed,
    this.revUscode,
    this.docname,
    this.sampledate,
    this.age,
    this.gender,
    this.oSerial,
    this.roname,
    this.revdate,
    this.name});

  factory LabResultModel.fromJson(Map<String, dynamic> jsonData) {
    return LabResultModel(
        patcode: jsonData['patcode'],
        mcode: jsonData['mcode'],
        adate: jsonData['adate'],
        doccode: jsonData['doccode'],
        labno: jsonData['labno'],
        state: jsonData['state'],
        notes: jsonData['notes'],
        reviewed: jsonData['reviewed'],
        revUscode:jsonData['revUscode'],
        docname:jsonData['docname'],
        sampledate: jsonData['sampledate'],
        age: jsonData['age'],
        gender: jsonData['gender'],
        oSerial: jsonData['oSerial'],
        roname: jsonData['roname'],
        revdate: jsonData['revdate'],
        name: jsonData['name'],
    );
  }
}