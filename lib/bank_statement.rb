# frozen_string_literal: true

# documentation about the class
class BankStatement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def statement_length
    @transactions.length
  end

  def add_transaction(transaction_info)
    @transactions.push(transaction_info)
  end
end
