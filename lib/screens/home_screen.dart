import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/employee_provider.dart';
import 'employee_detail_screen.dart';
import '../utils/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EmployeeProvider>(context, listen: false).getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    final employeeProvider = Provider.of<EmployeeProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xfff5fbfd),
      appBar: AppBar(
        backgroundColor: const Color(0xfff5fbfd),
        title: const Text(
          'Employee Management',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff2a73b7)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),

              /// Search bar widget with filtering logic
              child: SearchBarWidget(
                onSearch: (value) {
                  employeeProvider.filterEmployees(value); // Trigger filtering
                },
              ),
            ),
            _buildListOfEmployees(employeeProvider)
          ],
        ),
      ),
    );
  }

  /// method to build list of employees on the screen
  Widget _buildListOfEmployees(EmployeeProvider employeeProvider) {
    return Expanded(
        child: employeeProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : employeeProvider.employees.isEmpty
                ? const Center(
                    child: Text(
                    'No employees found',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xff2a73b7), fontWeight: FontWeight.w500),
                  ))
                : ListView.builder(
                    itemCount: employeeProvider.employees.length,
                    itemBuilder: (ctx, index) {
                      final employee = employeeProvider.employees[index];
                      return ListTile(
                        enabled: true,
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 210, 237, 250),
                          backgroundImage: employee.avatar.isNotEmpty
                              ? CachedNetworkImageProvider(
                                  employee.avatar,
                                  errorListener: (e) {
                                    print('Error loading avatar $e');
                                  },
                                )
                              : const AssetImage(
                                      'assets/images/deafult_image.png')
                                  as ImageProvider, // Default image if URL is empty
                        ),
                        title: Text(
                          employee.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(employee.email,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  EmployeeDetailScreen(employee: employee),
                            ),
                          );
                        },
                      );
                    },
                  ));
  }
}
