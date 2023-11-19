class Users {
  String? id;
  String email;
  String password;

  Users({
    this.id,
    required this.email,
    required this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "password": password,
  };
}