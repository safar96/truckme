class Application {
  int? id;
  int? categoryId;
  int? vehicleTypeId;
  int? workTypeId;
  double? sourceLatitude;
  double? sourceLongitude;
  double? targetLatitude;
  double? targetLongitude;
  String? description;
  double? weight;
  double? dimension;
  double? width;
  double? height;
  double? depth;
  double? distance;
  double? approxAmount;
  String? loadDateTime;
  String? receiverPhone;
  String? directionType;

  Application(
      {
        this.id,
        this.categoryId,
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