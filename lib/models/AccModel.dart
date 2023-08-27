class AccModel {
  int? patid;
  int? pseral;
  int? serial;
  String? roomNo;
  String? indate;
  String? outdate;
  String? statusOnDischarge;
  String? isOpration;
  int? docID;
  String? docname;

  AccModel({this.patid,
    this.pseral,
    this.serial,
    this.roomNo,
    this.indate,
    this.outdate,
    this.statusOnDischarge,
    this.isOpration,
    this.docID,
    this.docname});

    
  factory AccModel.fromJson(Map<String, dynamic> json) {
    return AccModel(
      pseral: json['pseral'],
      serial: json['serial'],
      roomNo: json['roomNo'],
      indate: json['indate'],
      outdate: json['outdate'],
      statusOnDischarge: json['statusOnDischarge'],
      isOpration: json['isOpration'],
      docID: json['docID'],
      docname: json['docname'],
    );

  }

}