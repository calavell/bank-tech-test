# frozen_string_literal: true

# statementprinter class
class StatementPrinter
  FORMATTED_HEADER = 'date || credit || debit || balance'
  attr_reader :statement_to_print, :header

  def initialize
    @header = FORMATTED_HEADER
    @printout = [@header]
  end

  def print_bank_statement(statement)
    raise 'There is no statement for this account' if statement.no_transactions?

    statement.transactions.each do |transaction|
      @printout.push("#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}")
    end
    puts @printout
    @printout
  end
end
