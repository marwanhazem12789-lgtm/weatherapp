class AuhtModel {
  String message;
  dynamic status;
  AuhtModel({required this.status, required this.message});
  factory AuhtModel.fomJson(Map<String, dynamic> Json) {
    return AuhtModel(status: Json["status"], message: Json["message"]);
  }
}