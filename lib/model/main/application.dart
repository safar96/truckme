class Application {
  int? categoryId;
  int? vehicleTypeId;
  int? workTypeId;
  int? sourceLatitude;
  int? sourceLongitude;
  int? targetLatitude;
  int? targetLongitude;
  String? description;
  int? weight;
  int? dimension;
  int? width;
  int? height;
  int? depth;
  int? distance;
  int? approxAmount;
  String? loadDateTime;
  String? receiverPhone;
  String? directionType;

  Application(
      {this.categoryId,
        this.vehicleTypeId,
        this.workTypeId,
        this.sourceLatitude,
        this.sourceLongitude,
        this.targetLatitude,
        this.targetLongitude,
        this.description,
        this.weight,
        this.dimension,
        this.width,
        this.height,
        this.depth,
        this.distance,
        this.approxAmount,
        this.loadDateTime,
        this.receiverPhone,
        this.directionType});

  Application.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    vehicleTypeId = json['vehicleTypeId'];
    workTypeId = json['workTypeId'];
    sourceLatitude = json['sourceLatitude'];
    sourceLongitude = json['sourceLongitude'];
    targetLatitude = json['targetLatitude'];
    targetLongitude = json['targetLongitude'];
    description = json['description'];
    weight = json['weight'];
    dimension = json['dimension'];
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
    distance = json['distance'];
    approxAmount = json['approxAmount'];
    loadDateTime = json['loadDateTime'];
    receiverPhone = json['receiverPhone'];
    directionType = json['directionType'];
  }
}