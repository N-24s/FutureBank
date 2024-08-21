


import '../Account/account.dart';
import '../Account/checkingAccount.dart';
import '../Account/savingsAccount .dart';
import '../Client/customer.dart';

class Bank {
  List<Customer> customers = [];

  void addCustomer(Customer customer) {
    customers.add(customer);
    customer.saveToFile(); 
  }

  void openAccount(String accountType, String customerName, double initialDeposit) {
 try{
     Customer customer = customers.firstWhere((c) => c.name == customerName);

    // if (customer == null) {
    //   print('Customer not found!');
    //   return;
    // }

    Account account;
    if (accountType == 'Checking') {
      account = CheckingAccount( 'CHK${customers.length + 1}', initialDeposit, customerName, 1000.0);
    } else if (accountType == 'Savings') {
      account = SavingsAccount('SAV${customers.length + 1}', initialDeposit, customerName, 0.02, 3);
    } else {
      print('Invalid account type!');
      return;
    }

    customer.addAccount(account);
    print('Account opened successfully for $customerName');

 }catch(e){
  print("Customer not found");

 }
  }

  void closeAccount(Account account) {
    account.saveTransaction('Account Closed', account.balance);
    print('Account ${account.accountNumber} closed.');
  }

  void applyInterest() {
    for (var customer in customers) {
      for (var account in customer.accounts) {
        if (account is SavingsAccount) {
          account.applyInterest();
        }
      }
    }
  }
}
