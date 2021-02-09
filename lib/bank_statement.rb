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

  def add_transaction(date:, credit:, debit:, balance:)
    transaction = @transaction_class.new(date, credit, debit, balance)
    @transactions.unshift(transaction)
  end
end
