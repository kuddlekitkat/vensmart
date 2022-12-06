class Data {
  int? id;
  String? type;
  String? name;
  String? email;
  dynamic age;
  dynamic gender;
  dynamic countryCode;
  String? mobile;
  dynamic emailVerifiedAt;
  dynamic otp;
  String? deviceId;
  String? deviceType;
  String? deviceName;
  String? deviceToken;
  String? apiToken;
  dynamic profile;
  String? status;
  dynamic serviceType;
  dynamic yearExpreance;
  dynamic location;
  dynamic locationLat;
  dynamic locationLong;
  dynamic idProf;
  String? documentsApproved;
  dynamic isOnline;
  dynamic whatApp;
  dynamic sms;
  dynamic notification;
  String? serviceTypePrice;
  dynamic guarantorName;
  dynamic guarantorEmail;
  dynamic guarantorPhoneNumber;
  dynamic guarantorAddress;
  dynamic serviceDiscription;
  String? state;
  String? town;
  dynamic gpsLocationStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.type,
    this.name,
    this.email,
    this.age,
    this.gender,
    this.countryCode,
    this.mobile,
    this.emailVerifiedAt,
    this.otp,
    this.deviceId,
    this.deviceType,
    this.deviceName,
    this.deviceToken,
    this.apiToken,
    this.profile,
    this.status,
    this.serviceType,
    this.yearExpreance,
    this.location,
    this.locationLat,
    this.locationLong,
    this.idProf,
    this.documentsApproved,
    this.isOnline,
    this.whatApp,
    this.sms,
    this.notification,
    this.serviceTypePrice,
    this.guarantorName,
    this.guarantorEmail,
    this.guarantorPhoneNumber,
    this.guarantorAddress,
    this.serviceDiscription,
    this.state,
    this.town,
    this.gpsLocationStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        type: json['type'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        age: json['age'] as dynamic,
        gender: json['gender'] as dynamic,
        countryCode: json['country_code'] as dynamic,
        mobile: json['mobile'] as String?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        otp: json['otp'] as dynamic,
        deviceId: json['device_id'] as String?,
        deviceType: json['device_type'] as String?,
        deviceName: json['device_name'] as String?,
        deviceToken: json['device_token'] as String?,
        apiToken: json['api_token'] as String?,
        profile: json['profile'] as dynamic,
        status: json['status'] as String?,
        serviceType: json['service_type'] as dynamic,
        yearExpreance: json['year_expreance'] as dynamic,
        location: json['location'] as dynamic,
        locationLat: json['location_lat'] as dynamic,
        locationLong: json['location_long'] as dynamic,
        idProf: json['id_prof'] as dynamic,
        documentsApproved: json['documents_approved'] as String?,
        isOnline: json['is_online'] as dynamic,
        whatApp: json['what_app'] as dynamic,
        sms: json['sms'] as dynamic,
        notification: json['notification'] as dynamic,
        serviceTypePrice: json['service_type_price'] as String?,
        guarantorName: json['guarantor_name'] as dynamic,
        guarantorEmail: json['guarantor_email'] as dynamic,
        guarantorPhoneNumber: json['guarantor_phone_number'] as dynamic,
        guarantorAddress: json['guarantor_address'] as dynamic,
        serviceDiscription: json['service_discription'] as dynamic,
        state: json['state'] as String?,
        town: json['town'] as String?,
        gpsLocationStatus: json['gps_location_status'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'email': email,
        'age': age,
        'gender': gender,
        'country_code': countryCode,
        'mobile': mobile,
        'email_verified_at': emailVerifiedAt,
        'otp': otp,
        'device_id': deviceId,
        'device_type': deviceType,
        'device_name': deviceName,
        'device_token': deviceToken,
        'api_token': apiToken,
        'profile': profile,
        'status': status,
        'service_type': serviceType,
        'year_expreance': yearExpreance,
        'location': location,
        'location_lat': locationLat,
        'location_long': locationLong,
        'id_prof': idProf,
        'documents_approved': documentsApproved,
        'is_online': isOnline,
        'what_app': whatApp,
        'sms': sms,
        'notification': notification,
        'service_type_price': serviceTypePrice,
        'guarantor_name': guarantorName,
        'guarantor_email': guarantorEmail,
        'guarantor_phone_number': guarantorPhoneNumber,
        'guarantor_address': guarantorAddress,
        'service_discription': serviceDiscription,
        'state': state,
        'town': town,
        'gps_location_status': gpsLocationStatus,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
