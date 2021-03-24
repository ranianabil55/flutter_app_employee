import 'package:flutter/material.dart';
import 'package:flutter_app_employee/model/employee.dart';
import 'package:flutter_app_employee/networking/employee_client.dart';
import 'package:flutter_app_employee/screens/add_employee.dart';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  Employee employees = new Employee();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
      ),
      body: FutureBuilder(
          future: EmployeeClient().getEmployee(),
          builder: (context, snapshot) {
            employees = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(employees.data[index].employeeName),
                      subtitle:
                          Text("Age ${employees.data[index].employeeAge}"),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 5,
                      color: Colors.grey,
                    );
                  },
                  itemCount: employees.data.length);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEmployee()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
