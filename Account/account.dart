import 'dart:io';

abstract class Account {
  String _accountNumber;
  double _balance;
  String customerName;

  Account(this._accountNumber, this._balance, this.customerName);


  String get accountNumber => _accountNumber;

  double get balance => _balance;


  set balance(double newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
    } else {
      print('Error: Balance cannot be negative.');
    }
  }

  void deposit(double amount) {
    balance += amount; 
    saveTransaction('Deposit', amount);
  }

  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      saveTransaction('Withdraw', amount);
    } else {
      print('Insufficient funds!');
    }
  }

  void transfer(Account toAccount, double amount) {
    if (balance >= amount) {
      withdraw(amount);
      toAccount.deposit(amount);
      saveTransaction('Transfer to ${toAccount.accountNumber}', amount);
    } else {
      print('Insufficient funds for transfer!');
    }
  }

  void saveTransaction(String type, double amount) {
    String transaction = '$type of \$${amount.toStringAsFixed(2)} on ${DateTime.now().toString()}\n';
    File('transactions_$_accountNumber.txt').writeAsStringSync(transaction, mode: FileMode.append);
  }

  void saveToFile() {
    String data = '$_accountNumber,$_balance,$customerName\n';
    File('accounts.txt').writeAsStringSync(data, mode: FileMode.append);
  }

  Map<String, String> getAccountDetails() {
    return {
      'Account Number': _accountNumber,
      'Balance': _balance.toString(),
      'Customer Name': customerName,
    };
  }
}



