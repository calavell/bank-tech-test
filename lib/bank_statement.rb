# frozen_string_literal: true

require_relative './transaction'

# bankstatement class
class BankStatement
  attr_reader :transactions

  def initialize(transaction_class = Transaction)
    @transactions = []
    @transaction_class = transaction_class
  end

  def statement_length
    @transactions.length
  end

  def add_transaction(date, amount, balance)
    transaction = @transaction_class.new(date, amount, balance)
    @transactions.push(transaction)
  end

  def no_transactions?
    @transactions.empty?
  end
end
