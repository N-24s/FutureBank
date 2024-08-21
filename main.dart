
import 'Bank/bank.dart';
import 'Client/customer.dart';
import 'inputData.dart';
import 'readFormFile.dart';

void main() {
  Bank futureBank = Bank();
  InputData inputData = InputData();

  String userID = inputData.getInput('Enter User ID: ');
  String password = inputData.getInput('Enter Password: ');
  String name = inputData.getInput('Enter Name: ');


  Customer customer = Customer(userID: userID, password: password, name: name);
  futureBank.addCustomer(customer);



  while (true) {
    print('\nChoose an option:');
    print('1: Open Account');
    print('2: Deposit');
    print('3: Withdraw');
    print('4: Transfer');
    print('5: Display Accounts');
       print('6: Display transaction');
    print('7: Exit');

    String choice = inputData.getInput('Enter your choice: ');

    switch (choice) {
      case '1':
        String accountType = inputData.getInput('Enter account type (Checking/Savings): ');
        double initialDeposit = inputData.getDoubleInput('Enter initial deposit: ');
        futureBank.openAccount(accountType, name, initialDeposit);
        break;

      case '2':

        double depositAmount = inputData.getDoubleInput('Enter deposit amount: ');
    
        try{
                         customer.accounts[0].deposit(depositAmount); 

        }catch(e){
          print(e);
        }
    
        
        break;

      case '3':
              double withdrawalAmount = inputData.getDoubleInput('Enter withdrawal amount: ');

      try{
           customer.accounts[0].withdraw(withdrawalAmount);
      }catch(e){
        print(e);
      }
     
        break;

      case '4':

        double transferAmount = inputData.getDoubleInput('Enter transfer amount: ');
          try{
        customer.accounts[0].transfer(customer.accounts[1], transferAmount); 
      }catch(e){
        print(e);
      }
        break;

    

      case '5':
        customer.displayAccounts();
        break;

      case '6':
        List<Map<String, String>> transactionsList = readTransactionsFromFile('transactions_CHK2.txt');
     try{
          displayTransactions(transactionsList);
      }catch(e){
        print(e);
      }
        break;
          case '7':
        print('Exiting...');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
 