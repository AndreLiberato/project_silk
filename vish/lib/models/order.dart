class OrderModel {
  String id;
  int number;
  String status;
  double valor;
  String creatorId;

  OrderModel(
      {required this.id,
      required this.number,
      required this.status,
      required this.valor,
      required this.creatorId});

  factory OrderModel.fromJson(String id, Map<String, dynamic> json) {
    return OrderModel(
        id: id,
        number: json["number"],
        status: json["status"],
        creatorId: json["creatorId"],
        valor: json["valor"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "number": number,
      "status": status,
      "valor": valor,
      "creatorId": creatorId
    };
  }
}
