class ProfileModal {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  double? height;
  double? weight;
  String? eyeColor;
  String? ip;
  String? macAddress;
  String? university;
  String? ein;
  String? ssn;
  String? userAgent;
  String? role;

  ProfileModal({
    this.id,
    this.firstName,
    this.lastName,
    this.maidenName,
    this.age,
    this.gender,
    this.email,
    this.phone,
    this.username,
    this.password,
    this.birthDate,
    this.image,
    this.bloodGroup,
    this.height,
    this.weight,
    this.eyeColor,
    this.ip,
    this.macAddress,
    this.university,
    this.ein,
    this.ssn,
    this.userAgent,
    this.role,
  });

  ProfileModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = (json['height'] as num?)?.toDouble();
    weight = (json['weight'] as num?)?.toDouble();
    eyeColor = json['eyeColor'];
    ip = json['ip'];
    macAddress = json['macAddress'];
    university = json['university'];
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
      'phone': phone,
      'username': username,
      'password': password,
      'birthDate': birthDate,
      'image': image,
      'bloodGroup': bloodGroup,
      'height': height,
      'weight': weight,
      'eyeColor': eyeColor,
      'ip': ip,
      'macAddress': macAddress,
      'university': university,
      'ein': ein,
      'ssn': ssn,
      'userAgent': userAgent,
      'role': role,
    };
  }
}
