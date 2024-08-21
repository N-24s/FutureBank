import 'dart:io';

List<Map<String, String>> readAccountsFromFile(String fileName) {
  List<Map<String, String>> accountsList = [];

  try {
    List<String> lines = File(fileName).readAsLinesSync();

    for (String line in lines) {
      List<String> parts = line.split(',');

      if (parts.length == 3) { 
        
        Map<String, String> accountData = {
          'Account Number': parts[0].trim(),
          'Balance': parts[1].trim(),
          'Customer Name': parts[2].trim(),
        };
        accountsList.add(accountData);
      }
    }
  } catch (e) {
    print('Error reading file: $e');
  }

  return accountsList;
}

void displayAccounts(List<Map<String, String>> accountsList) {
  for (var account in accountsList) {
    print('Account Number: ${account['Account Number']}');
    print('Balance: ${account['Balance']}');
    print('Customer Name: ${account['Customer Name']}');
    print('-----------------------');
  }
}


List<Map<String, String>> readTransactionsFromFile(String fileName) {
  List<Map<String, String>> transactionsList = [];

  try {
    List<String> lines = File(fileName).readAsLinesSync();

    for (String line in lines) {
      List<String> parts = line.split(' of '); 

      if (parts.length == 2) {
        Map<String, String> transactionData = {
          'Type': parts[0].trim(),
          'Amount': parts[1].split(' on ')[0].trim(),
          'Date': parts[1].split(' on ')[1].trim(),
        };
        transactionsList.add(transactionData);
      }
    }
  } catch (e) {
    print('Error reading file: $e');
  }

  return transactionsList;
}

void displayTransactions(List<Map<String, String>> transactionsList) {
  for (var transaction in transactionsList) {
    print('Transaction Type: ${transaction['Type']}');
    print('Amount: ${transaction['Amount']}');
    print('Date: ${transaction['Date']}');
    print('-----------------------');
  }
}

