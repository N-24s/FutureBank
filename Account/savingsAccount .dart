import 'account.dart';

class SavingsAccount extends Account {
  double _interestRate;
  int _withdrawalLimit;
  int withdrawalsThisMonth = 0;

  SavingsAccount(String accountNumber, double balance, String customerName, double interestRate, int withdrawalLimit)
      : _interestRate = interestRate,
        _withdrawalLimit = withdrawalLimit,
        super(accountNumber, balance, customerName);

  double get interestRate => _interestRate;
  int get withdrawalLimit => _withdrawalLimit;

  set interestRate(double newRate) {
    if (newRate <= 0.010) {
      _interestRate = newRate;
    } else {
      print('Interest rate must be positive.');
    }
  }

  set withdrawalLimit(int newLimit) {
    if (newLimit <= 100000) {
      _withdrawalLimit = newLimit;
    } else {
      print('Withdrawal limit must be non-negative.');
    }
  }

  @override
  void withdraw(double amount) {
    if (withdrawalsThisMonth < _withdrawalLimit && balance >= amount) {
      balance -= amount;
      withdrawalsThisMonth++;
      saveTransaction('Withdraw', amount);
    } else if (withdrawalsThisMonth >= _withdrawalLimit) {
      print('Withdrawal limit reached for this month.');
    } else {
      print('Insufficient funds!');
    }
  }

  void applyInterest() {
    double interest = balance * _interestRate;
    balance += interest;
    saveTransaction('Interest', interest);
  }
}


