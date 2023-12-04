class VehicleType {
  final int id;
  final String vehicleTypeNameUz;
  final String vehicleTypeNameRU;
  final String vehicleTypeNameCyril;
  final int categoryId;
  final int ord;

  VehicleType({
    required this.id,
    required this.vehicleTypeNameUz,
    required this.vehicleTypeNameRU,
    required this.vehicleTypeNameCyril,
    required this.categoryId,
    required this.ord,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
        id: json['description'] ?? 0,
        vehicleTypeNameUz: json['vehicleTypeNameUz'] ?? "",
        vehicleTypeNameRU: json['vehicleTypeNameRU'] ?? "",
        vehicleTypeNameCyril: json['vehicleTypeNameCyril'] ?? "",
        categoryId: json['categoryId'] ?? 0,
        ord: json['ord'] ?? 0,
      );
}
