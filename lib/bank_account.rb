# frozen_string_literal: true

require_relative './bank_statement'
require_relative './statement_printer'

# Bank account class which is initialized with a statement
class BankAccount
  OPENING_BALANCE = 0
  attr_reader :balance, :statement, :printer

  def initialize(bank_statement = BankStatement.new, statement_printer = StatementPrinter.new)
    @balance = OPENING_BALANCE
    @statement = bank_statement
    @printer = statement_printer
  end

  def credit_account(amount)
    @balance += amount
    update_statement(amount, nil)
  end

  def debit_account(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)

    @balance -= amount
    update_statement(nil, amount)
  end

  def current_balance
    @balance
  end

  def print_statement
    @printer.print_bank_statement(@statement)
  end

  private

  def insufficient_funds?(amount)
    (@balance - amount).negative?
  end

  def update_statement(credit, debit)
    @statement.add_transaction(Time.new.strftime('%d/%m/%Y'), credit, debit, @balance)
  end
end
