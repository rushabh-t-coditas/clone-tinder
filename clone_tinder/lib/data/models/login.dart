class Login {
  String uuid;
  String username;
  String password;

  Login({this.uuid, this.username, this.password});

  Login.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
