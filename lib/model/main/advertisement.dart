class Advertisement {
  final String id;
  final String image;
  final String carName;
  final String weightType;
  final String weight;
  final String amount;
  final String date;
  final String from;
  final String to;
  final String mile;
  final String paymentType;

  Advertisement({
    required this.id,
    required this.image,
    required this.carName,
    required this.weightType,
    required this.weight,
    required this.amount,
    required this.date,
    required this.from,
    required this.to,
    required this.mile,
    required this.paymentType,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
        id: json['description'] ?? "",
        image: json['image'] ?? "",
        carName: json['lang'] ?? "",
        weightType: json['title'] ?? "",
        weight: json['url'] ?? "",
        amount: '',
        date: '',
        from: '',
        to: '',
        mile: '',
        paymentType: '',
      );
}
