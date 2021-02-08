# frozen_string_literal: true

# bankstatement class
class BankStatement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def statement_length
    @transactions.length
  end

  def add_transaction(amount)
    transaction = { date: Time.new.strftime('%d/%m/%Y'), amount: amount, balance: @balance }
    @transactions.push(transaction)
  end
end
