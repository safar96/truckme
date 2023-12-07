class ApiResponse {
  final bool success;
  final List<DataItem> data;

  ApiResponse({
    required this.success,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] as bool? ?? false,
      data: json['data'] == null ? [] : json['data'].map<DataItem>((caseItem) => DataItem.fromJson(caseItem)).toList() ?? [],
    );
  }
}

class DataItem {
  final int id;
  final VehicleCategory vehicleCategory;
  final VehicleType vehicleType;
  final WorkType workType;
  final double sourceLatitude;
  final double sourceLongitude;
  final double targetLatitude;
  final double targetLongitude;
  final String description;
  final double dimension;
  final double width;
  final double height;
  final double depth;
  final double weight;
  final int distance;
  final double approxAmount;

  // final List<int> loadDateTime;
  final String receiverPhone;
  final String status;
  final String directionType;

  DataItem({
    required this.id,
    required this.vehicleCategory,
    required this.vehicleType,
    required this.workType,
    required this.sourceLatitude,
    required this.sourceLongitude,
    required this.targetLatitude,
    required this.targetLongitude,
    required this.description,
    required this.dimension,
    required this.width,
    required this.height,
    required this.depth,
    required this.weight,
    required this.distance,
    required this.approxAmount,
    // required this.loadDateTime,
    required this.receiverPhone,
    required this.status,
    required this.directionType,
  });

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      id: json['id'] as int? ?? 0,
      vehicleCategory: VehicleCategory.fromJson(json['vehicleCategory']),
      vehicleType: VehicleType.fromJson(json['vehicleType']),
      workType: WorkType.fromJson(json['workType']),
      sourceLatitude: json['sourceLatitude'] as double? ?? 0.0,
      sourceLongitude: json['sourceLongitude'] as double? ?? 0.0,
      targetLatitude: json['targetLatitude'] as double? ?? 0.0,
      targetLongitude: json['targetLongitude'] as double? ?? 0.0,
      description: json['description'] as String? ?? "",
      dimension: json['dimension'] as double? ?? 0.0,
      width: json['width'] as double? ?? 0.0,
      height: json['height'] as double? ?? 0.0,
      depth: json['depth'] as double? ?? 0.0,
      weight: json['weight'] as double? ?? 0.0,
      distance: json['distance'] as int? ?? 0,
      approxAmount: json['approxAmount'] as double? ?? 0.0,
      // loadDateTime: List<int>.from(json['loadDateTime'] as List<int>? ?? []),
      receiverPhone: json['receiverPhone'] as String? ?? "",
      status: json['status'] as String? ?? "",
      directionType: json['directionType'] as String? ?? "",
    );
  }
}

class VehicleCategory {
  final int id;
  final String categoryNameUz;
  final String categoryNameRu;
  final String categoryNameCyril;
  final dynamic description;
  final int ord;
  final int isActive;

  VehicleCategory({
    required this.id,
    required this.categoryNameUz,
    required this.categoryNameRu,
    required this.categoryNameCyril,
    required this.description,
    required this.ord,
    required this.isActive,
  });

  factory VehicleCategory.fromJson(Map<String, dynamic> json) {
    return VehicleCategory(
      id: json['id'] as int? ?? 0,
      categoryNameUz: json['categoryNameUz'] as String? ?? "",
      categoryNameRu: json['categoryNameRu'] as String? ?? "",
      categoryNameCyril: json['categoryNameCyril'] as String? ?? "",
      description: json['description'],
      ord: json['ord'] as int? ?? 0,
      isActive: json['isActive'] as int? ?? 0,
    );
  }
}

class VehicleType {
  final int id;
  final int categoryId;
  final String vehicleTypeNameUz;
  final String vehicleTypeNameRU;
  final String vehicleTypeNameCyril;
  final dynamic ord;

  VehicleType({
    required this.id,
    required this.categoryId,
    required this.vehicleTypeNameUz,
    required this.vehicleTypeNameRU,
    required this.vehicleTypeNameCyril,
    required this.ord,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      id: json['id'] as int? ?? 0,
      categoryId: json['categoryId'] as int? ?? 0,
      vehicleTypeNameUz: json['vehicleTypeNameUz'] as String? ?? "",
      vehicleTypeNameRU: json['vehicleTypeNameRU'] as String? ?? "",
      vehicleTypeNameCyril: json['vehicleTypeNameCyril'] as String? ?? "",
      ord: json['ord'],
    );
  }
}

class WorkType {
  final int id;
  final String vehicleTypeNameUz;
  final String vehicleTypeNameRU;
  final String vehicleTypeNameCyril;
  final int isActive;
  final dynamic ord;

  WorkType({
    required this.id,
    required this.vehicleTypeNameUz,
    required this.vehicleTypeNameRU,
    required this.vehicleTypeNameCyril,
    required this.isActive,
    required this.ord,
  });

  factory WorkType.fromJson(Map<String, dynamic> json) {
    return WorkType(
      id: json['id'] as int? ?? 0,
      vehicleTypeNameUz: json['vehicleTypeNameUz'] as String? ?? "",
      vehicleTypeNameRU: json['vehicleTypeNameRU'] as String? ?? "",
      vehicleTypeNameCyril: json['vehicleTypeNameCyril'] as String? ?? "",
      isActive: json['isActive'] as int? ?? 0,
      ord: json['ord'],
    );
  }
}
