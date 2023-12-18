// FIREBASE
class Users {
  String? docId;
  String? id;
  String username;
  String email;
  String? password;
  String? phone;

  Users({
    this.docId,
    this.id,
    required this.username,
    required this.email,
    this.password,
    this.phone,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        docId: json["docId"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"] ?? ""
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone ?? ""
      };
}
