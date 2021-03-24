import 'package:flutter_app_employee/model/employee.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeClient {
  Future<Employee> getEmployee() async {
    final String url = 'http://dummy.restapiexample.com/api/v1/employees';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Employee.fromJson(json);
    } else
      throw Exception("error to get Employee");
  }

  Future<bool> addEmployee(dynamic body) async {
    final String url = 'http://dummy.restapiexample.com/api/v1/create';
    final response = await http.post(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return true;
    } else
      return false;
  }
}
