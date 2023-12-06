class Users {
  String? docId;
  String? id;
  String? username;
  String? email;
  String? password;
  String? phone;

  Users({
    this.docId,
    this.id,
    this.phone,
    this.username,
    this.email,
    this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        docId: json["docId"] as String,
        id: json["userId"] as String,
        username: json["name"] as String,
        email: json["email"] as String,
        password: json["password"] as String,
        phone: json['phone'] as String ?? ""
      );

  Map<String, dynamic> toJson() {
    String formattedPhone = phone ?? "";
    // if (!formattedPhone.startsWith('+')) {
    //   formattedPhone = '+$formattedPhone';
    // }
    if (formattedPhone.length > 15) {
      formattedPhone = formattedPhone.substring(0, 15);
    }
    return {
          "docId": docId,
          "userId": id,
          "name": username,
          "email": email,
          "password": password,
          "phone": formattedPhone
    };
  }
}
