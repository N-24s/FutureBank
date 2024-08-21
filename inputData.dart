import 'dart:io';

class InputData {
  String getInput(String prompt) {
    stdout.write(prompt);
    return stdin.readLineSync()!;
  }

  double getDoubleInput(String prompt) {
    while (true) {
      String input = getInput(prompt);
      try {
        return double.parse(input);
      } catch (e) {
        print('Please enter a valid number.');
      }
    }
  }

  int getIntInput(String prompt) {
    while (true) {
      String input = getInput(prompt);
      try {
        return int.parse(input);
      } catch (e) {
        print('Please enter a valid number.');
      }
    }
  }

  bool getConfirmation(String prompt) {
    String input = getInput(prompt + " (y/n): ").toLowerCase();
    return input == 'y' || input == 'yes';
  }
}
