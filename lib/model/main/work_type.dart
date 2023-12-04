class WorkType {
  final int id;
  final String vehicleTypeNameUz;
  final String vehicleTypeNameRU;
  final String vehicleTypeNameCyril;
  final int isActive;
  final int ord;

  WorkType({
    required this.id,
    required this.vehicleTypeNameUz,
    required this.vehicleTypeNameRU,
    required this.vehicleTypeNameCyril,
    required this.isActive,
    required this.ord,
  });

  factory WorkType.fromJson(Map<String, dynamic> json) => WorkType(
        id: json['description'] ?? 0,
        vehicleTypeNameUz: json['vehicleTypeNameUz'] ?? "",
        vehicleTypeNameRU: json['vehicleTypeNameRU'] ?? "",
        vehicleTypeNameCyril: json['vehicleTypeNameCyril'] ?? "",
        isActive: json['isActive'] ?? 0,
        ord: json['ord'] ?? 0,
      );
}
