class Users {
  String? id;
  String username;
  String email;
  String password;

  Users({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
      };

  // factory Users.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
  //   final data = json.data();
  //   return Users(
  //     docId: json.id,
  //     id: data?["id"],
  //     username: data?["username"],
  //     email: data?["email"],
  //     password: data?["password"],
  //   );}
}
