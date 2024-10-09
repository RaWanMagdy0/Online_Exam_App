import 'package:online_exam100/domain/model/User.dart';

class UserDto extends User {
  UserDto({
    super.id,
    super.username,
    super.firstName,
    super.lastName,
    super.email,
    super.phone,
    super.role,
    super.isVerified,
    super.createdAt,
    super.passwordChangedAt,
    super.passwordResetCode,
    super.passwordResetExpires,
    super.resetCodeVerified,
    super.token,
  });

  UserDto.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    isVerified = json['isVerified'];
    createdAt = json['createdAt'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['isVerified'] = isVerified;
    map['createdAt'] = createdAt;
    map['passwordChangedAt'] = passwordChangedAt;
    map['passwordResetCode'] = passwordResetCode;
    map['passwordResetExpires'] = passwordResetExpires;
    map['resetCodeVerified'] = resetCodeVerified;
    map['token'] = token;

    return map;
  }
  User toUser(){
    return User(
      token: token,
      lastName:lastName ,
      email: email,
      firstName:firstName ,
      phone: phone,
      username:username ,
      isVerified:isVerified ,
      id: id,
      createdAt:createdAt ,
      role: role,
    );
  }

}
