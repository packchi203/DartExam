import 'dart:io';

class Employee {
  int id;
  String fullName;
  DateTime birthday;
  String address;
  String phoneNumber;

  Employee(this.id, this.fullName, this.birthday, this.address, this.phoneNumber);
}

class EmployeeManagement {
  List<Employee> employees = [];

  void addNewEmployee(Employee employee) {
    employees.add(employee);
    print('Add employee successfull');
  }

  List<Employee> getAllEmployees() {
    return employees;
  }

  void updateEmployee(int id, Employee updatedEmployee) {
    for (int i = 0; i < employees.length; i++) {
      if (employees[i].id == id) {
        employees[i] = updatedEmployee;
        print('update employee successfull');
        return;
      }
    }
    print('Not found employee ID: $id');
  }
}

void main() {
  final employeeManagement = EmployeeManagement();

  while (true) {
    print('\n Select:');
    print('1. Add new employee');
    print('2. Get All Employee');
    print('3. Update Employee');
    print('4. Exit');
    stdout.write('Enter your choice: ');

    String choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        stdout.write('Enter ID: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        stdout.write('Enter Fullname: ');
        String fullName = stdin.readLineSync() ?? '';

        stdout.write('Enter Birthdate(yyyy-MM-dd): ');
        DateTime birthday = DateTime.tryParse(stdin.readLineSync() ?? '') ?? DateTime.now();

        stdout.write('Enter Address: ');
        String address = stdin.readLineSync() ?? '';

        stdout.write('Enter Phone Number: ');
        String phoneNumber = stdin.readLineSync() ?? '';

        final newEmployee = Employee(id, fullName, birthday, address, phoneNumber);
        employeeManagement.addNewEmployee(newEmployee);
        break;

      case '2':
        final employees = employeeManagement.getAllEmployees();
        if (employees.isEmpty) {
          print('List of enployee is empty.');
        } else {
          print('\n All Employee:');
          for (var employee in employees) {
            print('ID: ${employee.id}');
            print('Full Name: ${employee.fullName}');
            print('Birthdate: ${employee.birthday.toLocal()}');
            print('Address: ${employee.address}');
            print('Phone Number: ${employee.phoneNumber}');
            print('--------------------------------------------');
          }
        }
        break;

      case '3':
        stdout.write('Enter employee ID to update: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

        final existingEmployee = employeeManagement.employees.firstWhere(
  (employee) => employee.id == id,
  orElse: () => Employee(-1, '', DateTime.now(), '', ''), // Giá trị mặc định
);

        if (existingEmployee != null) {
          stdout.write('Enter New Fullname:: ');
          String fullName = stdin.readLineSync() ?? '';

          stdout.write('Enter New Birthdate(yyyy-MM-dd): ');
          DateTime birthday = DateTime.tryParse(stdin.readLineSync() ?? '') ?? DateTime.now();

          stdout.write('Enter New Address: ');
          String address = stdin.readLineSync() ?? '';

          stdout.write('Enter new Phone number: ');
          String phoneNumber = stdin.readLineSync() ?? '';

          final updatedEmployee = Employee(id, fullName, birthday, address, phoneNumber);
          employeeManagement.updateEmployee(id, updatedEmployee);
        } else {
          print('Not found employee ID: $id');
        }
        break;

      case '4':
        print('Exit.');
        exit(0);

      default:
        print('Invalid selection. Please choose again.');
    }
  }
}
