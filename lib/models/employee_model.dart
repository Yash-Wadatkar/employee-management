/// Model for Employee
class Employee {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String mobile;
  final String country;
  final String state;
  final String district;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.mobile,
    required this.country,
    required this.state,
    required this.district,
  });

  /// converting json data to dart
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? '',
      name: json['name'] ?? 'No username',
      email: json['emailId'] ?? 'No email found', // Handling if emailId is null
      avatar: json['avatar'] ?? '',
      mobile: json['mobile'] ?? '',
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      district: json['district'] ?? '',
    );
  }
}
