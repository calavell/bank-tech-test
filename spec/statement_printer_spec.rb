# frozen_string_literal: true

require 'transaction'
require 'statement_printer'

describe StatementPrinter do

  answer = "date || credit || debit || balance\n08/02/2021 || 5 ||  || 5\n09/02/2021 || 5 ||  || 10\n10/02/2021 ||  || 2 || 8\n"

  empty_answer = "date || credit || debit || balance\n"

  let(:printer) { described_class.new }
  let(:transaction1) { double(Transaction, date: Date.new(2021,2,8), credit: 5, debit: nil, balance: 5) }
  let(:transaction2) { double(Transaction, date: Date.new(2021,2,9), credit: 5, debit: nil, balance: 10) }
  let(:transaction3) { double(Transaction, date: Date.new(2021,2,10), credit: nil, debit: 2, balance: 8) }
  let(:transaction_list) { [transaction1, transaction2, transaction3] }
  let(:bank_statement) { double(BankStatement, transactions: transaction_list) }
  let(:empty_bank_statement) { double(BankStatement, transactions: []) }
  
  describe '#print_statement' do
      it 'prints off a statement in the correct format' do
        expect { printer.print_bank_statement(bank_statement) }.to output(answer).to_stdout
      end

      it 'prints off a statement in the correct format when there are no transaction' do
        expect { printer.print_bank_statement(empty_bank_statement) }.to output(empty_answer).to_stdout
      end
  end
end
