class PostOffice {
  String name;
  String description;
  String pinCode;
  String branchType;
  String deliveryStatus;
  String taluka;
  String circle;
  String district;
  String division;
  String region;
  String state;
  String country;

  PostOffice({
    required this.name,
    required this.description,
    required this.pinCode,
    required this.branchType,
    required this.deliveryStatus,
    required this.taluka,
    required this.circle,
    required this.district,
    required this.division,
    required this.region,
    required this.state,
    required this.country,
  });

  factory PostOffice.fromMap(Map<String, dynamic> map) {
    return PostOffice(
      name: map['Name'].toString(),
      description: map['Description'].toString(),
      pinCode: map['PINCode'].toString(),
      branchType: map['BranchType'].toString(),
      deliveryStatus: map['DeliveryStatus'].toString(),
      taluka: map['Taluk'].toString(),
      circle: map['Circle'].toString(),
      district: map['District'].toString(),
      division: map['Division'].toString(),
      region: map['Region'].toString(),
      state: map['State'].toString(),
      country: map['Country'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Description': description,
      'PINCode': pinCode,
      'BranchType': branchType,
      'DeliveryStatus': deliveryStatus,
      'Taluk': taluka,
      'Circle': circle,
      'District': district,
      'Division': division,
      'Region': region,
      'State': state,
      'Country': country,
    };
  }

  @override
  String toString() {
    return toMap.toString();
  }
}
