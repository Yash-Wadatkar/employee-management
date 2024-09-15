import 'dart:convert';
import 'package:employee_management/models/employee_model.dart';
import 'package:http/http.dart' as http;

/// class to get the data from api
class EmployeeService {
  static const String apiUrl =
      'https://669b3f09276e45187d34eb4e.mockapi.io/api/v1/employee';

  Future<List<Employee>> fetchEmployees() async {
    /// try catch block to handle exceptions
    try {
      print('Fetching employees...');

      /// parsing the url to uri and fetching the response
      final response = await http.get(Uri.parse(apiUrl));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      /// handling if response is success then convert it to dart list
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Employee.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load employees: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching employees: $e');
      throw Exception('Failed to fetch employees');
    }
  }
}
