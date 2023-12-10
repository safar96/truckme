class SApplication {
  int? categoryId;
  int? vehicleTypeId;
  int? workTypeId;
  double? targetLatitude;
  double? targetLongitude;
  String? description;
  double? approxAmount;
  String? loadDateTime;
  String? receiverPhone;

  SApplication(
      {this.categoryId,
        this.vehicleTypeId,
        this.workTypeId,
        this.targetLatitude,
        this.targetLongitude,
        this.description,
        this.approxAmount,
        this.loadDateTime,
        this.receiverPhone,});

  SApplication.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    vehicleTypeId = json['vehicleTypeId'];
    workTypeId = json['workTypeId'];
    targetLatitude = json['targetLatitude'];
    targetLongitude = json['targetLongitude'];
    description = json['description'];
    approxAmount = json['approxAmount'];
    loadDateTime = json['loadDateTime'];
    receiverPhone = json['receiverPhone'];
  }
}