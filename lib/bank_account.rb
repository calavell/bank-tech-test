# frozen_string_literal: true

require_relative './bank_statement'

# documentation about the class
class BankAccount
  OPENING_BALANCE = 0
  attr_reader :balance, :statement

  def initialize(bank_statement = BankStatement.new)
    @balance = OPENING_BALANCE
    @statement = bank_statement
  end

  def adjust_balance(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)

    @balance += amount
    update_statement(amount)
  end

  def current_balance
    @balance
  end

  def no_transactions?
    @statement.transactions.empty?
  end

  private

  def insufficient_funds?(amount)
    (@balance + amount).negative?
  end

  def update_statement(amount)
    transaction_info = { date: Time.new.strftime('%d/%m/%Y'), amount: amount, balance: @balance }
    @statement.add_transaction(transaction_info)
  end
end
