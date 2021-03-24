import 'package:flutter/material.dart';
import 'package:flutter_app_employee/networking/employee_client.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  var _employeeNameController = TextEditingController();
  final _employeeAgeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Add Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _employeeNameController,
              decoration: InputDecoration(hintText: "Employee Name"),
            ),
            TextField(
              controller: _employeeAgeController,
              decoration: InputDecoration(hintText: "Employee Age"),
            ),
            RaisedButton(
                child: Text("ADD"),
                onPressed: () {
                  final body = {
                    "name": _employeeNameController.text,
                    "age": _employeeAgeController.text
                  };
                  EmployeeClient().addEmployee(body).then((success) {
                    if (success) {
                      print("gj/////////////////////////////");
                      showDialog(context) => AlertDialog(
                            title: Text("Employee Added"),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _employeeNameController.text = ' ';
                                    _employeeAgeController.text = '';
                                  },
                                  child: Text("Ok"))
                            ],
                          );
                    } else {
                      print("111111111111111111111111");
                      showDialog(context) => AlertDialog(
                            title: Text("Employee Not Added"),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _employeeNameController.text = ' ';
                                    _employeeAgeController.text = '';
                                  },
                                  child: Text("Ok"))
                            ],
                          );
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}
