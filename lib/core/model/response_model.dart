class ResponseModel {
  int? statecode;
  String? address1Stateorprovince;
  String? name;
  String? accountnumber;
  String? entityimage;
  ResponseModel({
    this.statecode,
    this.address1Stateorprovince,
    this.name,
    this.accountnumber,
    this.entityimage,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    statecode = json['statecode'];
    address1Stateorprovince = json['address1_stateorprovince'];
    name = json['name'];
    accountnumber = json['accountnumber'];
    entityimage = json['entityimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statecode'] = statecode;
    data['address1_stateorprovince'] = address1Stateorprovince;
    data['name'] = name;
    data['accountnumber'] = accountnumber;
    data['entityimage'] = entityimage;
    return data;
  }
}
