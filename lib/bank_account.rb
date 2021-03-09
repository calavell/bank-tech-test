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
    update_statement(credit: amount, debit: nil)
  end

  def debit_account(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)

    @balance -= amount
    update_statement(credit: nil, debit: amount)
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

# Given the current printing format is a row with a column for both credit and debit,
# I thought it best that every transaction maintains data for each column.
# One of these will always be nill
  def update_statement(credit:, debit:)
    @statement.add_transaction(date: Time.new, credit: credit, debit: debit, balance: @balance)
  end
end
