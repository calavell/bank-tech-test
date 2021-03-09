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
    statement.transactions.each do |transaction|
      @printout.push("#{transaction.date.strftime('%d/%m/%Y')} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}")
    end
    puts @printout
  end
end
