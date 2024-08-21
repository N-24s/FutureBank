

import '../Account/account.dart';
import 'user.dart';

class Customer extends User  {

  List<Account> accounts = [];

  Customer({ required super.userID, required super.password, required super.name});

  void addAccount(Account account) {
    accounts.add(account);
    account.saveToFile();
  }

  void displayAccounts() {
    for (var account in accounts) {
      print(account.getAccountDetails());
    }
  }
}
