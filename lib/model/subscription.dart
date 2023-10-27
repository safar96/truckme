class Subscription {
  final String id;
  final int duration_in_days;
  final int price;

  Subscription({
    required this.id,
    required this.duration_in_days,
    required this.price,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'] ?? "",
        duration_in_days: json['duration_in_days'] ?? 0,
        price: json['price'] ?? 0,
      );
}
