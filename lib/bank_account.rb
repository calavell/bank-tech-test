class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def adjust_balance(amount)
    raise 'Insufficient funds' if insufficient_funds?(amount)

    @balance += amount
  end

  def current_balance
    @balance
  end

  private

  def insufficient_funds?(amount)
    (@balance + amount).negative?
  end
end
