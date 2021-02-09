# frozen_string_literal: true

# transaction class
class Transaction
  attr_reader :date, :balance, :credit, :debit

  def initialize(date, credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
