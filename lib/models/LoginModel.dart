import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String uUsername;
    String uPassword;

    LoginModel({
        this.uUsername,
        this.uPassword,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        uUsername: json["u_username"],
        uPassword: json["u_password"],
    );

    Map<String, dynamic> toJson() => {
        "u_username": uUsername,
        "u_password": uPassword,
    };
}
