class BankStatement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def statement_length
    @transactions.length
  end

  def transactions
    @transactions
  end

  def add_transaction(date, amount, balance)
    transaction = { :date => date, :amount => amount, :balance => balance }
    @transactions.push(transaction)
  end
end
