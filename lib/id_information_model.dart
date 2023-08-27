class IdInformationModel {
  String? adress;
  String? name;
  String? ssn;

  IdInformationModel({this.adress, this.name, this.ssn});

  IdInformationModel.fromJson(Map<String, dynamic> json) {
    adress = json['adress'];
    name = json['name'];
    ssn = json['ssn'];
  }
}
