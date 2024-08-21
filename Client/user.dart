

import 'dart:io';

class User {
  late String userID,password, name;
  String? address;
  

  User({required this.userID, required this.password,required this.name});
  void saveToFile() {
    String data = '$userID,$password,$name,$address\n';
    File('users.txt').writeAsStringSync(data, mode: FileMode.append);
  }

  static bool userExists(String password,String name) {
    try {
      List<String> lines = File('users.txt').readAsLinesSync();
      for (String line in lines) {
        List<String> parts = line.split(',');
        if (parts[1] == password && parts[2]==name) {
          return true;
        }
      }
    } catch (e) {
      print('Error reading file: $e');
    }
    return false;
  }

  void login() {
    if (userExists(password,name)) {
      print('User $userID logged in with  $password.');
    } else {
      print('User $userID does not exist.');
    }
  }

  void logout() {
    print('User $userID logged out.');
  }
}
