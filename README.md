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
- You can add or subtract money from the account by using the adjust_balance method which will accept a positive or negative integer. Eg. ```bank_account.adjust_balance(10)``` to credit your account, and ```bank_account.adjust_balance(-10)```  to debit your account.
- You can view your current balance like so:  ```bank_account.current_balance```.
- You can view your printed bank statement at any time by using the print_statement method, eg. ```bank_account.print_statement```. This will only work once you have made at least one transaction.
