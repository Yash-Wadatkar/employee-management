// screens/employee_detail_screen.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_management/utils/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final Employee employee;

  EmployeeDetailScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fbfd),
      appBar: AppBar(
        title: Text(employee.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(255, 210, 237, 250),
                  backgroundImage: employee.avatar.isNotEmpty
                      ? CachedNetworkImageProvider(
                          employee.avatar,
                          errorListener: (e) {
                            print('Error loading avatar $e');
                          },
                        )
                      : const AssetImage('assets/images/deafult_image.png')
                          as ImageProvider, // Default image if URL is empty
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: CustomTextFieldWidget(
                  textfieldName: 'Name',
                  textfieldData: employee.name,
                ),
              ),
              CustomTextFieldWidget(
                textfieldName: 'Email',
                textfieldData: employee.email,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 16),
                child: CustomTextFieldWidget(
                  textfieldName: 'Mobile',
                  textfieldData: employee.mobile,
                ),
              ),
              CustomTextFieldWidget(
                textfieldName: 'Country',
                textfieldData: employee.country,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: CustomTextFieldWidget(
                  textfieldName: 'State',
                  textfieldData: employee.state,
                ),
              ),
              CustomTextFieldWidget(
                textfieldName: 'District',
                textfieldData: employee.district,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
