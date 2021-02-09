# frozen_string_literal: true

# statementprinter class
class StatementPrinter
  FORMATTED_HEADER = 'date || credit || debit || balance'
  attr_reader :statement_to_print, :header

  def initialize
    @header = FORMATTED_HEADER
    @statement_to_print = [@header]
  end

  def print_statement(statement)
    raise 'There is no statement for this account' if statement.no_transactions?

    statement.transactions.each do |transaction|
      if transaction[:amount].negative? == true
        @statement_to_print.push("#{transaction[:date]} || || #{transaction[:amount].abs} || #{transaction[:balance]}")
      else
        @statement_to_print.push("#{transaction[:date]} || #{transaction[:amount]} ||  || #{transaction[:balance]}")
      end
    end
    @statement_to_print
  end

  def self.instance
    @statement_printer ||= StatementPrinter.new
  end
end
