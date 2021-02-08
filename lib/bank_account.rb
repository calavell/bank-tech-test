require_relative './bank_statement.rb'

class BankAccount
  OPENING_BALANCE = 0
  attr_reader :balance, :statement

  def initialize(bank_statement = BankStatement.new, balance = OPENING_BALANCE)
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
    @statement.transactions.length == 0
  end

  private

  def insufficient_funds?(amount)
    (@balance + amount).negative?
  end

  def update_statement(amount)
    @statement.add_transaction(Time.new.strftime("%d/%m/%Y"), amount, @balance)
  end
end