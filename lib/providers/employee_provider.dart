import 'package:flutter/material.dart';
import '../models/employee_model.dart';
import '../service/employee_services.dart';

/// provider for employee screen /// Employee Providder
class EmployeeProvider with ChangeNotifier {
  List<Employee> _employees = [];
  List<Employee> _filteredEmployees = [];
  bool _isLoading = false;
  String _error = '';

  List<Employee> get employees => _filteredEmployees; // Return filtered list
  bool get isLoading => _isLoading;
  String get error => _error;

  /// Fetch the employees and initialize the filtered list
  Future<void> getEmployees() async {
    _isLoading = true;
    notifyListeners();

    try {
      _employees = await EmployeeService().fetchEmployees();
      _filteredEmployees = _employees; // Initialize the filtered list
      _error = '';
    } catch (e) {
      _error = 'Failed to load employees';
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Update search query and filter the list
  void filterEmployees(String query) {
    if (query.isEmpty) {
      _filteredEmployees = _employees;

      /// Reset to full list if query is empty
    } else {
      _filteredEmployees = _employees.where((employee) {
        return employee.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();

    /// Notify UI to update
  }
}
