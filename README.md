# Bank tech test

This is a mock tech test completed as part of my coding bootcamp with Makers Academy.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## High Level Class Diagram

![Screenshot](class-diagram.png)

## Running the app

- clone this repository to your local machine.
- cd into the directory named bank-tech-update_statement.
- run  ```bundle instal```.
- If you do not have bundler on your local machine, run  ```rspec --init```  in the commandline to intall the testing suite.
- To run your tests, run  ```rspec```  in the command line and the output will show in your terminal.
- To run that app, from within the root directory run  ```irb -r './lib/bank_account.rb'```.
- To get started, initialize an instance of the BankAccount class. For example  ```bank_account = BankAccount.new```.
- You can add money to the account by using the credit_account method which will accept a positive integer. Eg. ```bank_account.credit_account(10)``` to credit your account.
- You can take money from the account by using the debit_account method which will accept a positive integer. Eg. ```bank_account.debit_account(10)``` to debit your account.
- You can view your current balance like so:  ```bank_account.current_balance```.
- You can view your printed bank statement at any time by using the print_statement method, eg. ```bank_account.print_statement```. This will only work once you have made at least one transaction.

## Approach
- My approach with the app was to have a mixture of classes serving different purposes but from a user point of view, I only wanted the bank account class to be the one that is being interacted with. The other classes are called on from the bank account class
- The app was built using a TDD approach. I also tried to focus on ease of change as the main feature of the app which is printing is based on a specific format which could be subject to change. I wanted to build the app in a way that would allow for quick changes if another column had to be added to the statement.

## Code Structure
- The code is structured into 4 different classes (BankAccount, BankStatement, StatementPrinter, and Transaction). The classes are all linked together through the bank account class. A bank statement is created automatically when a new bank account is created, and this is also the case for a printer. Transactions are created ad hoc as the account is debited an d credited. These class files can all be found in the lib directory with the file name matching each class.
- The test files can be found in the spec directory. There is a different file for each class. There is no testing file for the transaction class as it only has state and no methods.

## Screenshots
![Screenshot](./images/new_bank_account.png)

Creating a new bank account

![Screenshot](./images/crediting_bank_account.png)

Crediting the bank account

![Screenshot](./images/debiting_bank_account.png)

Debiting the bank account

![Screenshot](./images/checking_bank_balance.png)

Checking your balance

![Screenshot](./images/printing_bank_statement.png)

Printing your statement
