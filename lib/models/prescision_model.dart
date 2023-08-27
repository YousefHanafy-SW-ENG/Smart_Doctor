class PrecisionModel {
  String? admitionDischarge;
  String? unit;
  int? noOfUnits;
  String? routeDescription;
  String? startingFrom;
  String? direction;
  String? endDate;
  int? refill;
  String? medicationType;
  String? reasonForUse;
  String? status;
  int? serial;
  String? freqTimes;
  String? freqEveryNo;
  String? freqEveryUnit;
  String? freqForNo;
  String? freqForUnit;
  int? medicationID;
  int? visitID;
  String? freqText;
  String? docname;
  int? doctorID;
  String? typeOfOrder;
  String? sncode;
  String? iname;

  PrecisionModel({this.admitionDischarge,
    this.unit,
    this.noOfUnits,
    this.routeDescription,
    this.startingFrom,
    this.direction,
    this.endDate,
    this.refill,
    this.medicationType,
    this.reasonForUse,
    this.status,
    this.serial,
    this.freqTimes,
    this.freqEveryNo,
    this.freqEveryUnit,
    this.freqForNo,
    this.freqForUnit,
    this.medicationID,
    this.visitID,
    this.freqText,
    this.docname,
    this.doctorID,
    this.typeOfOrder,
    this.sncode,
    this.iname});

  factory PrecisionModel.fromJson(Map<String, dynamic> jsonData) {
    return PrecisionModel(
      admitionDischarge: jsonData['admitionDischarge'],
      unit: jsonData['unit'],
      noOfUnits: jsonData['noOfUnits'],
      routeDescription: jsonData['routeDescription'],
      startingFrom: jsonData['startingFrom'],
      direction: jsonData['direction'],
      endDate: jsonData['endDate'],
      refill: jsonData['refill'],
      medicationType: jsonData['medicationType'],
      reasonForUse: jsonData['reasonForUse'],
      status: jsonData['status'],
      serial: jsonData['serial'],
      freqTimes: jsonData['freqTimes'],
      freqEveryNo: jsonData['freqEveryNo'],
      freqEveryUnit: jsonData['freqEveryUnit'],
      freqForNo: jsonData['freqForNo'],
      freqForUnit: jsonData['freqForUnit'],
      medicationID: jsonData['medicationID'],
      visitID: jsonData['visitID'],
      freqText: jsonData['freqText'],
      docname: jsonData['docname'],
      doctorID: jsonData['doctorID'],
      typeOfOrder: jsonData['typeOfOrder'],
      sncode: jsonData['sncode'],
      iname: jsonData['iname'],
    );
  }
}